#ifndef TRACE_H
#define TRACE_H

#include "fips202.h"
#include "poly.h"
#include "polyvec.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

#ifndef TRACE_MAX_ENTRIES
#define TRACE_MAX_ENTRIES 10
#endif

static FILE *__trace_file = NULL;
static int __trace_first = 1;

/* ---------- distribution table ----------
 * Owner-keyed for exactly the same reason as the snapshot table below:
 * an instrumented function frequently calls OTHER instrumented
 * functions (polyvec_ntt -> poly_ntt), and each inner PRINT_ARGS runs
 * json_end to completion. With a single global table reset on every
 * json_end, any TRACE_DISTRIBUTION registered by the outer function
 * before those inner calls would be silently destroyed. Scoping each
 * entry to its owning funcname makes registration order irrelevant --
 * TRACE_DISTRIBUTION may be placed at the top of a function, before
 * the work, rather than being forced to sit immediately above
 * PRINT_ARGS. */
#define TRACE_MAX_DISTRIBUTIONS 16
typedef struct {
  const char *owner;
  const char *name;
  const char *description;
  int in_use;
} trace_distribution_t;

static trace_distribution_t __trace_distributions[TRACE_MAX_DISTRIBUTIONS] = {
    {0}};

#define TRACE_MAX_FUNCTIONS 32
typedef struct {
  const char *name;
  long entries;
  int initialized;
} trace_function_state_t;

static trace_function_state_t __trace_functions[TRACE_MAX_FUNCTIONS];
static size_t __trace_function_count = 0;

/* ---------- "also-input" snapshot table ----------
 *
 * Each entry is OWNED by the function that recorded it (the funcname
 * later passed to PRINT_ARGS). This ownership is essential: an
 * in-place function like poly_ntt typically calls OTHER instrumented
 * functions (poly_reduce) between taking its snapshot and reaching its
 * own PRINT_ARGS. Those inner PRINT_ARGS calls run json_begin/json_end
 * to completion, and a global "reset everything on json_end" would
 * destroy the outer function's still-pending snapshot -- which is
 * exactly the bug this replaces (the "<name>_in" key silently vanished
 * from every in-place function whose body called an instrumented
 * helper). json_end now only releases entries owned by the function
 * that is currently being written.
 *
 * Entries also store a FULL VALUE ARRAY, not a single scalar, so a
 * poly/polyvec snapshot captures all KYBER_N (or KYBER_K*KYBER_N)
 * coefficients instead of just coeffs[0]. "<name>_in" is emitted as a
 * JSON array in that case, mirroring how the post-call "<name>" is
 * printed by json_poly_ptr/json_polyvec_ptr. Scalars still emit a bare
 * number, so nothing about the existing single-value format changes.
 */
#define TRACE_MAX_SNAPSHOTS 4
#define TRACE_MAX_SNAPSHOT_VALUES (KYBER_K * KYBER_N)

typedef struct {
  const char *owner; /* funcname that recorded this entry */
  const char *name;  /* JSON key, matching the INOUT(...) name */
  long long values[TRACE_MAX_SNAPSHOT_VALUES];
  size_t count;  /* number of valid entries in values[] */
  int is_array;  /* 1 -> emit as [..], 0 -> emit values[0] bare */
  int has_value; /* 0 -> emit null (NULL ptr / unsupported type) */
  int in_use;
} trace_snapshot_t;

static trace_snapshot_t __trace_snapshots[TRACE_MAX_SNAPSHOTS];

/* Set by json_begin, cleared by json_end -- identifies which function's
 * PRINT_ARGS is currently being written, so snapshot lookup/release can
 * be scoped to that function alone. */
static const char *__trace_current_func = NULL;

static inline trace_snapshot_t *__trace_snapshot_alloc(void) {
  for (int i = 0; i < TRACE_MAX_SNAPSHOTS; i++) {
    if (!__trace_snapshots[i].in_use)
      return &__trace_snapshots[i];
  }
  /* Table full: evict slot 0 rather than silently dropping the new
   * snapshot, so the most recent recording always wins. */
  return &__trace_snapshots[0];
}

/* Records a snapshot owned by `owner`. `values` may be NULL (unsupported
 * type or NULL pointer) -> emitted as null. */
static inline void __trace_snapshot_store_n(const char *owner,
                                            const char *name,
                                            const long long *values,
                                            size_t count, int is_array,
                                            int has_value) {
  trace_snapshot_t *s = __trace_snapshot_alloc();
  s->owner = owner;
  s->name = name;
  s->is_array = is_array;
  s->has_value = has_value;
  s->count = 0;
  if (values && has_value) {
    if (count > TRACE_MAX_SNAPSHOT_VALUES)
      count = TRACE_MAX_SNAPSHOT_VALUES;
    for (size_t i = 0; i < count; i++)
      s->values[i] = values[i];
    s->count = count;
  }
  s->in_use = 1;
}

static inline void __trace_snapshot_store(const char *owner, const char *name,
                                          long long value, int has_value) {
  __trace_snapshot_store_n(owner, name, &value, 1, 0, has_value);
}

/* Only matches entries owned by the function currently being written. */
static inline trace_snapshot_t *__trace_snapshot_find(const char *name) {
  if (!__trace_current_func)
    return NULL;
  for (int i = 0; i < TRACE_MAX_SNAPSHOTS; i++) {
    trace_snapshot_t *s = &__trace_snapshots[i];
    if (s->in_use && s->owner && strcmp(s->owner, __trace_current_func) == 0 &&
        strcmp(s->name, name) == 0)
      return s;
  }
  return NULL;
}

/* Releases ONLY the current function's entries -- a nested instrumented
 * call must not disturb an outer function's pending snapshot. */
static inline void __trace_snapshot_reset(void) {
  if (!__trace_current_func)
    return;
  for (int i = 0; i < TRACE_MAX_SNAPSHOTS; i++) {
    trace_snapshot_t *s = &__trace_snapshots[i];
    if (s->in_use && s->owner &&
        strcmp(s->owner, __trace_current_func) == 0)
      s->in_use = 0;
  }
}

/* Releases ONLY the current function's entries. */
static inline void __trace_distribution_reset(void) {
  if (!__trace_current_func)
    return;
  for (size_t i = 0; i < TRACE_MAX_DISTRIBUTIONS; i++) {
    trace_distribution_t *d = &__trace_distributions[i];
    if (d->in_use && d->owner && strcmp(d->owner, __trace_current_func) == 0)
      d->in_use = 0;
  }
}

static inline void __trace_distribution_store(const char *owner,
                                              const char *name,
                                              const char *description) {
  for (size_t i = 0; i < TRACE_MAX_DISTRIBUTIONS; i++) {
    if (!__trace_distributions[i].in_use) {
      __trace_distributions[i].owner = owner;
      __trace_distributions[i].name = name;
      __trace_distributions[i].description = description;
      __trace_distributions[i].in_use = 1;
      return;
    }
  }
}

static inline long __trace_count_entries(const char *filename) {
  FILE *f = fopen(filename, "r");
  if (!f)
    return 0;
  long count = 0;
  int c;
  while ((c = fgetc(f)) != EOF) {
    if (c == '\n')
      count++;
  }
  fclose(f);
  return count;
}

static inline void json_begin(const char *funcname) {
  char filename[256];
  trace_function_state_t *state = NULL;

  /* Scope snapshot lookup/release to this function for the duration of
   * this PRINT_ARGS. Set before every early return, so json_end can
   * always release the right entries. */
  __trace_current_func = funcname;

  for (size_t i = 0; i < __trace_function_count; i++) {
    if (strcmp(__trace_functions[i].name, funcname) == 0) {
      state = &__trace_functions[i];
      break;
    }
  }

  if (!state && __trace_function_count < TRACE_MAX_FUNCTIONS) {
    state = &__trace_functions[__trace_function_count++];
    state->name = funcname;
    state->entries = 0;
    state->initialized = 0;
  }

  if (state && !state->initialized) {
    snprintf(filename, sizeof(filename), "../function_inputs/%s.json",
             funcname);
    state->entries = __trace_count_entries(filename);
    state->initialized = 1;
  }

  if (state && state->entries >= TRACE_MAX_ENTRIES) {
    __trace_file = NULL;
    return;
  }

  snprintf(filename, sizeof(filename), "../function_inputs/%s.json", funcname);

  __trace_file = fopen(filename, "a");
  if (!__trace_file)
    return;

  fprintf(__trace_file, "{");
  __trace_first = 1;
  if (state)
    state->entries++;
}

static inline void json_end(void) {
  if (!__trace_file) {
    __trace_snapshot_reset();
    __trace_distribution_reset();
    __trace_current_func = NULL;
    return;
  }

  fprintf(__trace_file, "}\n");
  fclose(__trace_file);
  __trace_file = NULL;
  __trace_snapshot_reset();
  __trace_distribution_reset();
  __trace_current_func = NULL;
}

static inline void json_sep(void) {
  if (!__trace_first)
    fprintf(__trace_file, ",");

  __trace_first = 0;
}

static inline void json_emit_snapshot(const char *name) {
  trace_snapshot_t *snap = __trace_snapshot_find(name);
  if (!snap)
    return; /* no TRACE_SNAPSHOT call for this name: omit silently */

  json_sep();
  if (!snap->has_value) {
    fprintf(__trace_file, "\"%s_in\":null", name);
  } else if (snap->is_array) {
    fprintf(__trace_file, "\"%s_in\":[", name);
    for (size_t i = 0; i < snap->count; i++)
      fprintf(__trace_file, "%s%lld", i ? "," : "", snap->values[i]);
    fprintf(__trace_file, "]");
  } else {
    fprintf(__trace_file, "\"%s_in\":%lld", name, snap->values[0]);
  }
  snap->in_use = 0;
}

static inline void json_output_array(const char *const *outputs, size_t count) {
  json_sep();
  if (count == 1) {
    const char *name = outputs[0];
    int inout = (name[0] == '*');
    if (inout)
      name++;
    fprintf(__trace_file, "\"output\":\"%s\"", name);
    if (inout)
      json_emit_snapshot(name);
    return;
  }

  fprintf(__trace_file, "\"output\":[");
  for (size_t i = 0; i < count; i++) {
    const char *name = outputs[i];
    if (name[0] == '*')
      name++;
    fprintf(__trace_file, "%s\"%s\"", (i > 0) ? "," : "", name);
  }
  fprintf(__trace_file, "]");

  for (size_t i = 0; i < count; i++) {
    const char *name = outputs[i];
    if (name[0] != '*')
      continue;
    json_emit_snapshot(name + 1);
  }
}

static inline void json_int(const char *name, int x) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%d", name, x);
}
static inline void json_uint(const char *name, unsigned int x) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%u", name, x);
}
static inline void json_ulong(const char *name, unsigned long x) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%lu", name, x);
}
static inline void json_char_ptr(const char *name, char *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%d", name, p ? (int)(unsigned char)(*p) : -1);
}
static inline void json_const_char_ptr(const char *name, const char *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%d", name, p ? (int)(unsigned char)(*p) : -1);
}
static inline void json_uchar_ptr(const char *name, unsigned char *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%u", name, p ? (unsigned)(*p) : 0);
}
static inline void json_const_uchar_ptr(const char *name,
                                        const unsigned char *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%u", name, p ? (unsigned)(*p) : 0);
}
static inline void json_uint64_ptr(const char *name, const uint64_t *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%llu", name,
          p ? (unsigned long long)(*p) : 0ULL);
}
static inline void json_const_uint64_ptr(const char *name, const uint64_t *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%llu", name,
          p ? (unsigned long long)(*p) : 0ULL);
}
static inline void json_uchar(const char *name, unsigned char x) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%u", name, (unsigned)x);
}
static inline void json_int16(const char *name, int16_t x) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%d", name, (int)x);
}
static inline void json_int16_ptr(const char *name, int16_t *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%d", name, p ? (int)(*p) : -1);
}
static inline void json_const_int16_ptr(const char *name, const int16_t *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":%d", name, p ? (int)(*p) : -1);
}
static inline void json_poly_ptr(const char *name, poly *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":[", name);
  for (size_t i = 0; i < KYBER_N; i++)
    fprintf(__trace_file, "%s%d", i ? "," : "", p ? (int)(*p)[i] : 0);
  fprintf(__trace_file, "]");
}
static inline void json_const_poly_ptr(const char *name, const poly *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":[", name);
  for (size_t i = 0; i < KYBER_N; i++)
    fprintf(__trace_file, "%s%d", i ? "," : "", p ? (int)(*p)[i] : 0);
  fprintf(__trace_file, "]");
}
static inline void json_polyvec_ptr(const char *name, polyvec *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":[", name);
  for (size_t j = 0; j < KYBER_K; j++) {
    if (j)
      fprintf(__trace_file, ",");
    fprintf(__trace_file, "[");
    for (size_t i = 0; i < KYBER_N; i++)
      fprintf(__trace_file, "%s%d", i ? "," : "", p ? (int)(*p)[j][i] : 0);
    fprintf(__trace_file, "]");
  }
  fprintf(__trace_file, "]");
}
static inline void json_const_polyvec_ptr(const char *name, const polyvec *p) {
  json_sep();
  fprintf(__trace_file, "\"%s\":[", name);
  for (size_t j = 0; j < KYBER_K; j++) {
    if (j)
      fprintf(__trace_file, ",");
    fprintf(__trace_file, "[");
    for (size_t i = 0; i < KYBER_N; i++)
      fprintf(__trace_file, "%s%d", i ? "," : "", p ? (int)(*p)[j][i] : 0);
    fprintf(__trace_file, "]");
  }
  fprintf(__trace_file, "]");
}
static inline void json_keccak_state_ptr(const char *name,
                                         const keccak_state *state) {
  json_sep();
  fprintf(__trace_file, "\"%s\":[", name);
  for (size_t i = 0; i < 26; i++)
    fprintf(__trace_file, "%s%llu", i ? "," : "",
            state ? (unsigned long long)(*state)[i] : 0ULL);
  fprintf(__trace_file, "]");
}
static inline void json_unknown(const char *name, ...) {
  json_sep();
  fprintf(__trace_file, "\"%s\":\"unknown\"", name);
}

static inline void json_distributions(void) {
  int any = 0;
  if (!__trace_current_func)
    return;
  for (size_t i = 0; i < TRACE_MAX_DISTRIBUTIONS; i++) {
    trace_distribution_t *d = &__trace_distributions[i];
    if (d->in_use && d->owner &&
        strcmp(d->owner, __trace_current_func) == 0 && d->name &&
        d->description) {
      any = 1;
      break;
    }
  }
  if (!any)
    return;

  json_sep();
  fprintf(__trace_file, "\"distribution\":{");
  int first = 1;
  for (size_t i = 0; i < TRACE_MAX_DISTRIBUTIONS; i++) {
    trace_distribution_t *d = &__trace_distributions[i];
    if (!d->in_use || !d->owner ||
        strcmp(d->owner, __trace_current_func) != 0 || !d->name ||
        !d->description)
      continue;
    fprintf(__trace_file, "%s\"%s\":\"%s\"", first ? "" : ",", d->name,
            d->description);
    first = 0;
  }
  fprintf(__trace_file, "}");
}

/* ---------- snapshot printers ----------
 * Mirror the json_* printers above, but store into the owner-keyed
 * snapshot table instead of writing to the file. Every one takes the
 * owning funcname as its first parameter (see __trace_snapshot_store's
 * comment for why ownership matters). poly/polyvec variants copy the
 * WHOLE coefficient array, so "<name>_in" is a full pre-call
 * polynomial rather than just coeffs[0]. */
static inline void __snap_int(const char *o, const char *n, int x) {
  __trace_snapshot_store(o, n, x, 1);
}
static inline void __snap_uint(const char *o, const char *n, unsigned int x) {
  __trace_snapshot_store(o, n, x, 1);
}
static inline void __snap_ulong(const char *o, const char *n, unsigned long x) {
  __trace_snapshot_store(o, n, (long long)x, 1);
}
static inline void __snap_uchar(const char *o, const char *n, unsigned char x) {
  __trace_snapshot_store(o, n, x, 1);
}
static inline void __snap_int16(const char *o, const char *n, int16_t x) {
  __trace_snapshot_store(o, n, x, 1);
}
static inline void __snap_char_ptr(const char *o, const char *n, char *p) {
  __trace_snapshot_store(o, n, p ? (long long)(unsigned char)(*p) : -1,
                         p != NULL);
}
static inline void __snap_const_char_ptr(const char *o, const char *n,
                                         const char *p) {
  __trace_snapshot_store(o, n, p ? (long long)(unsigned char)(*p) : -1,
                         p != NULL);
}
static inline void __snap_uchar_ptr(const char *o, const char *n,
                                    unsigned char *p) {
  __trace_snapshot_store(o, n, p ? (long long)(*p) : 0, p != NULL);
}
static inline void __snap_const_uchar_ptr(const char *o, const char *n,
                                          const unsigned char *p) {
  __trace_snapshot_store(o, n, p ? (long long)(*p) : 0, p != NULL);
}
static inline void __snap_uint64_ptr(const char *o, const char *n,
                                     const uint64_t *p) {
  __trace_snapshot_store(o, n, p ? (long long)(*p) : 0, p != NULL);
}
static inline void __snap_const_uint64_ptr(const char *o, const char *n,
                                           const uint64_t *p) {
  __trace_snapshot_store(o, n, p ? (long long)(*p) : 0, p != NULL);
}
static inline void __snap_int16_ptr(const char *o, const char *n, int16_t *p) {
  __trace_snapshot_store(o, n, p ? (long long)(*p) : -1, p != NULL);
}
static inline void __snap_const_int16_ptr(const char *o, const char *n,
                                          const int16_t *p) {
  __trace_snapshot_store(o, n, p ? (long long)(*p) : -1, p != NULL);
}

static inline void __snap_poly_ptr(const char *o, const char *n, poly *p) {
  long long buf[KYBER_N];
  if (!p) {
    __trace_snapshot_store_n(o, n, NULL, 0, 1, 0);
    return;
  }
  for (size_t i = 0; i < KYBER_N; i++)
    buf[i] = (long long)(*p)[i];
  __trace_snapshot_store_n(o, n, buf, KYBER_N, 1, 1);
}
static inline void __snap_const_poly_ptr(const char *o, const char *n,
                                         const poly *p) {
  long long buf[KYBER_N];
  if (!p) {
    __trace_snapshot_store_n(o, n, NULL, 0, 1, 0);
    return;
  }
  for (size_t i = 0; i < KYBER_N; i++)
    buf[i] = (long long)(*p)[i];
  __trace_snapshot_store_n(o, n, buf, KYBER_N, 1, 1);
}

/* polyvec is flattened to KYBER_K*KYBER_N values. The post-call
 * "<name>" from json_polyvec_ptr is NESTED ([[..],[..],[..]]) while
 * this is FLAT -- driver_dist.py treats both as a byte buffer anyway,
 * and flattening keeps the snapshot struct a fixed size. */
static inline void __snap_polyvec_ptr(const char *o, const char *n,
                                      polyvec *p) {
  long long buf[KYBER_K * KYBER_N];
  if (!p) {
    __trace_snapshot_store_n(o, n, NULL, 0, 1, 0);
    return;
  }
  for (size_t j = 0; j < KYBER_K; j++)
    for (size_t i = 0; i < KYBER_N; i++)
      buf[j * KYBER_N + i] = (long long)(*p)[j][i];
  __trace_snapshot_store_n(o, n, buf, KYBER_K * KYBER_N, 1, 1);
}
static inline void __snap_const_polyvec_ptr(const char *o, const char *n,
                                            const polyvec *p) {
  long long buf[KYBER_K * KYBER_N];
  if (!p) {
    __trace_snapshot_store_n(o, n, NULL, 0, 1, 0);
    return;
  }
  for (size_t j = 0; j < KYBER_K; j++)
    for (size_t i = 0; i < KYBER_N; i++)
      buf[j * KYBER_N + i] = (long long)(*p)[j][i];
  __trace_snapshot_store_n(o, n, buf, KYBER_K * KYBER_N, 1, 1);
}

static inline void __snap_unknown(const char *o, const char *n, ...) {
  __trace_snapshot_store(o, n, 0, 0);
}

#define PRINT_ARG(x)                                                           \
  _Generic((x),                                                                \
      int: json_int,                                                           \
      unsigned int: json_uint,                                                 \
      unsigned long: json_ulong,                                               \
      unsigned char: json_uchar,                                               \
      int16_t: json_int16,                                                     \
      char *: json_char_ptr,                                                   \
      const char *: json_const_char_ptr,                                       \
      unsigned char *: json_uchar_ptr,                                         \
      const unsigned char *: json_const_uchar_ptr,                             \
      uint64_t *: json_uint64_ptr,                                             \
      const uint64_t *: json_const_uint64_ptr,                                 \
      int16_t *: json_int16_ptr,                                               \
      const int16_t *: json_const_int16_ptr,                                   \
      poly *: json_poly_ptr,                                                   \
      const poly *: json_const_poly_ptr,                                       \
      polyvec *: json_polyvec_ptr,                                             \
      const polyvec *: json_const_polyvec_ptr,                                 \
      keccak_state *: json_keccak_state_ptr,                                   \
      const keccak_state *: json_keccak_state_ptr,                             \
      default: json_unknown)(#x, (x))

#define __SNAPSHOT_DISPATCH(x)                                                 \
  _Generic((x),                                                                \
      int: __snap_int,                                                         \
      unsigned int: __snap_uint,                                               \
      unsigned long: __snap_ulong,                                             \
      unsigned char: __snap_uchar,                                             \
      int16_t: __snap_int16,                                                   \
      char *: __snap_char_ptr,                                                 \
      const char *: __snap_const_char_ptr,                                     \
      unsigned char *: __snap_uchar_ptr,                                       \
      const unsigned char *: __snap_const_uchar_ptr,                           \
      uint64_t *: __snap_uint64_ptr,                                           \
      const uint64_t *: __snap_const_uint64_ptr,                               \
      int16_t *: __snap_int16_ptr,                                             \
      const int16_t *: __snap_const_int16_ptr,                                 \
      poly *: __snap_poly_ptr,                                                 \
      const poly *: __snap_const_poly_ptr,                                     \
      polyvec *: __snap_polyvec_ptr,                                           \
      const polyvec *: __snap_const_polyvec_ptr,                               \
      default: __snap_unknown)

#define FE_1(WHAT, X) WHAT(X)
#define FE_2(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_1(WHAT, __VA_ARGS__)
#define FE_3(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_2(WHAT, __VA_ARGS__)
#define FE_4(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_3(WHAT, __VA_ARGS__)
#define FE_5(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_4(WHAT, __VA_ARGS__)
#define FE_6(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_5(WHAT, __VA_ARGS__)
#define FE_7(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_6(WHAT, __VA_ARGS__)
#define FE_8(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_7(WHAT, __VA_ARGS__)
#define FE_9(WHAT, X, ...)                                                     \
  WHAT(X);                                                                     \
  FE_8(WHAT, __VA_ARGS__)
#define FE_10(WHAT, X, ...)                                                    \
  WHAT(X);                                                                     \
  FE_9(WHAT, __VA_ARGS__)

#define GET_MACRO(_1, _2, _3, _4, _5, _6, _7, _8, _9, _10, NAME, ...) NAME

#define FOR_EACH(action, ...)                                                  \
  GET_MACRO(__VA_ARGS__, FE_10, FE_9, FE_8, FE_7, FE_6, FE_5, FE_4, FE_3,      \
            FE_2, FE_1)                                                        \
  (action, __VA_ARGS__)

#define PRINT_OUTPUT_ARRAY(...)                                                \
  do {                                                                         \
    const char *__outputs[] = {__VA_ARGS__};                                   \
    size_t __count = sizeof(__outputs) / sizeof(__outputs[0]);                 \
    json_output_array(__outputs, __count);                                     \
  } while (0)

#define __MBC_PROBE(...) ~, 1
#define __MBC_IS_PAREN_PROBE(...) __MBC_PROBE()
#define __MBC_CHECK_N(a, b, ...) b
#define __MBC_CHECK(...) __MBC_CHECK_N(__VA_ARGS__, 0)
#define __MBC_IS_PAREN(x) __MBC_CHECK(__MBC_IS_PAREN_PROBE x)

#define __MBC_CAT(a, b) a##b
#define __MBC_IIF(cond) __MBC_CAT(__MBC_IIF_, cond)
#define __MBC_IIF_0(t, f) f
#define __MBC_IIF_1(t, f) t

#define __MBC_DISPATCH_OUTPUT(x)                                               \
  __MBC_IIF(__MBC_IS_PAREN(x))(PRINT_OUTPUT_ARRAY x, PRINT_OUTPUT_ARRAY(x))

#define INOUT(name) "*" name

/*
 * TRACE_DISTRIBUTION(funcname, arg_name, arg_description)
 *   Declare the distribution an argument is sampled from. `funcname`
 *   must match the funcname later passed to PRINT_ARGS (ownership --
 *   see the distribution table comment above).
 *
 * TRACE_DISTRIBUTION_IN(funcname, arg_name, arg_description)
 *   Declare the distribution of an in-place argument's PRE-call value,
 *   registering it under "<arg_name>_in" to match the "<arg_name>_in"
 *   key that INOUT(...)+TRACE_SNAPSHOT emit. Relies on adjacent string
 *   literal concatenation, so arg_name must be a literal.
 *
 *   This matters beyond documentation: for an in-place function the
 *   pre- and post-call values live in DIFFERENT domains (poly_ntt's r
 *   goes in as centered-binomial noise and comes out in the NTT
 *   domain). driver_dist.py randomizes an also_input buffer BEFORE the
 *   call, so it must sample from the INPUT distribution -- tagging only
 *   the output domain makes it feed NTT-domain values into a function
 *   expecting coefficient-domain noise.
 */
#define TRACE_DISTRIBUTION(funcname, arg_name, arg_description)                \
  __trace_distribution_store((funcname), (arg_name), (arg_description))

#define TRACE_DISTRIBUTION_IN(funcname, arg_name, arg_description)             \
  __trace_distribution_store((funcname), arg_name "_in", (arg_description))

/*
 * TRACE_SNAPSHOT(funcname, x)
 *   Record x's pre-mutation value, owned by `funcname`, keyed under the
 *   stringified expression #x. `funcname` MUST match the funcname later
 *   passed to PRINT_ARGS, and the key must match the INOUT(...) name:
 *
 *     TRACE_SNAPSHOT("poly_ntt", r);
 *     ntt(*r); poly_reduce(r);
 *     PRINT_ARGS("poly_ntt", INOUT("r"), r);
 *
 *   Passing the funcname is what lets an inner instrumented call
 *   (poly_reduce here) run its own PRINT_ARGS without destroying this
 *   pending snapshot.
 *
 * TRACE_SNAPSHOT_AS(funcname, name, x)
 *   Same, but with an explicit key when it differs from the expression:
 *
 *     TRACE_SNAPSHOT_AS("poly_tomont", "r", r->coeffs);
 */
#if KYBER_K == 3
#define TRACE_SNAPSHOT(funcname, x) __SNAPSHOT_DISPATCH(x)((funcname), #x, (x))
#define TRACE_SNAPSHOT_AS(funcname, name, x)                                   \
  __SNAPSHOT_DISPATCH(x)((funcname), (name), (x))
#else
#define TRACE_SNAPSHOT(funcname, x)                                            \
  do {                                                                         \
  } while (0)
#define TRACE_SNAPSHOT_AS(funcname, name, x)                                   \
  do {                                                                         \
  } while (0)
#endif

#if KYBER_K == 3
#define PRINT_ARGS(funcname, output_args, ...)                                 \
  do {                                                                         \
    json_begin(funcname);                                                      \
    if (__trace_file) {                                                        \
      __MBC_DISPATCH_OUTPUT(output_args);                                      \
      FOR_EACH(PRINT_ARG, __VA_ARGS__);                                        \
      json_distributions();                                                    \
    }                                                                          \
    json_end();                                                                \
  } while (0)
#else
#define PRINT_ARGS(...)                                                        \
  do {                                                                         \
  } while (0)
#endif

#endif