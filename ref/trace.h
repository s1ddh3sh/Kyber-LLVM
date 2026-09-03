#ifndef TRACE_H
#define TRACE_H

#include "fips202.h"
#include "poly.h"
#include "polyvec.h"
#include <stdint.h>
#include <stdio.h>
#include <string.h>

/* Maximum number of trace entries (lines) kept in any single
 * function_inputs/<funcname>.json file. Once a file already has this
 * many entries, PRINT_ARGS becomes a no-op for that function (the
 * entry is rejected, nothing is appended). This caps runaway file
 * growth for functions that get called extremely often. */
#ifndef TRACE_MAX_ENTRIES
#define TRACE_MAX_ENTRIES 10
#endif

static FILE *__trace_file = NULL;
static int __trace_first = 1;

#define TRACE_MAX_DISTRIBUTIONS 8
typedef struct {
  const char *name;
  const char *description;
} trace_distribution_t;

static trace_distribution_t __trace_distributions[TRACE_MAX_DISTRIBUTIONS] = {
    {0}};
static size_t __trace_distribution_count = 0;

#define TRACE_MAX_FUNCTIONS 32
typedef struct {
  const char *name;
  long entries;
  int initialized;
} trace_function_state_t;

static trace_function_state_t __trace_functions[TRACE_MAX_FUNCTIONS];
static size_t __trace_function_count = 0;

/* ---------- "also-input" snapshot table ----------
 * For in-place functions (e.g. poly_ntt(poly *r) where r is both the
 * input and the output) the value printed at PRINT_ARGS time is the
 * *post*-mutation value. To also record the *pre*-mutation value,
 * call TRACE_SNAPSHOT(x) / TRACE_SNAPSHOT_AS(name, x) BEFORE the
 * mutation happens (i.e. at the top of the function), then mark the
 * corresponding entry in the output_args of PRINT_ARGS with
 * INOUT(...) instead of a bare string. This causes an extra
 * "<name>_in" field to be emitted alongside the normal "<name>"
 * (post-mutation) field.
 *
 * Downstream (extract_qemu_witness.py's derive_layout) must be
 * updated to look for an optional "<name>_in" key for any output
 * name it already treats as in-place, the same way it was updated to
 * accept output_key as either a str or a list.
 */
#define TRACE_MAX_SNAPSHOTS 8

typedef struct {
  const char *name;
  long long value;
  int has_value; /* 0 if the pointer was NULL / type unsupported */
  int used;
} trace_snapshot_t;

static trace_snapshot_t __trace_snapshots[TRACE_MAX_SNAPSHOTS];
static int __trace_snapshot_count = 0;

static inline void __trace_snapshot_store(const char *name, long long value,
                                          int has_value) {
  if (__trace_snapshot_count >= TRACE_MAX_SNAPSHOTS)
    return; /* table full: silently drop, PRINT_ARGS will just omit _in */
  __trace_snapshots[__trace_snapshot_count].name = name;
  __trace_snapshots[__trace_snapshot_count].value = value;
  __trace_snapshots[__trace_snapshot_count].has_value = has_value;
  __trace_snapshots[__trace_snapshot_count].used = 0;
  __trace_snapshot_count++;
}

static inline trace_snapshot_t *__trace_snapshot_find(const char *name) {
  for (int i = 0; i < __trace_snapshot_count; i++) {
    if (!__trace_snapshots[i].used &&
        strcmp(__trace_snapshots[i].name, name) == 0)
      return &__trace_snapshots[i];
  }
  return NULL;
}

static inline void __trace_snapshot_reset(void) { __trace_snapshot_count = 0; }

static inline void __trace_distribution_reset(void) {
  __trace_distribution_count = 0;
}

/* ---------- per-file entry cap ---------- */
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
    return;
  }

  fprintf(__trace_file, "}\n");
  fclose(__trace_file);
  __trace_file = NULL;
  __trace_snapshot_reset();
  __trace_distribution_reset();
}

static inline void json_sep(void) {
  if (!__trace_first)
    fprintf(__trace_file, ",");

  __trace_first = 0;
}

/* Emits "<name>_in":<value> for an in-place output, if a snapshot was
 * recorded for that name (via TRACE_SNAPSHOT / TRACE_SNAPSHOT_AS)
 * before the function mutated the argument. */
static inline void json_emit_snapshot(const char *name) {
  trace_snapshot_t *snap = __trace_snapshot_find(name);
  if (!snap)
    return; /* no TRACE_SNAPSHOT call made for this name: omit silently */

  json_sep();
  if (snap->has_value)
    fprintf(__trace_file, "\"%s_in\":%lld", name, snap->value);
  else
    fprintf(__trace_file, "\"%s_in\":null", name);
  snap->used = 1;
}

/*
 * Prints "output":"NAME" when there is exactly one output (matches the
 * original single-output format exactly, so existing consumers of
 * function_inputs/.json that expect sample["output"] to be a plain
 * string keep working unmodified), and "output":["A","B",...] when
 * there are two or more. Downstream (extract_qemu_witness.py's
 * derive_layout) must be updated to accept output_key as either a str
 * or a list before this is used on any function with >1 output.
 *
 * A name prefixed with '*' (produced by wrapping it in INOUT(...))
 * marks that output as "also input": the '*' is stripped before it is
 * written to "output", and a matching "<name>_in" field is emitted
 * from the snapshot table if one was recorded.
 */
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

/* ---------- printers ---------- */
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

/* Kyber polynomial coefficients are int16_t; add explicit support so
 * in-place poly functions (poly_ntt, poly_invntt_tomont, ...) print a
 * real value instead of falling through to json_unknown. */
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
  if (!__trace_distribution_count)
    return;
  json_sep();
  fprintf(__trace_file, "\"distribution\":{");
  int first = 1;
  for (size_t i = 0; i < __trace_distribution_count; i++) {
    if (!__trace_distributions[i].name || !__trace_distributions[i].description)
      continue;
    fprintf(__trace_file, "%s\"%s\":\"%s\"", first ? "" : ",",
            __trace_distributions[i].name,
            __trace_distributions[i].description);
    first = 0;
  }
  fprintf(__trace_file, "}");
}

/* ---------- snapshot printers (mirror the printers above, but store
 * into the snapshot table instead of writing to the file) ---------- */
static inline void __snap_int(const char *name, int x) {
  __trace_snapshot_store(name, x, 1);
}

static inline void __snap_uint(const char *name, unsigned int x) {
  __trace_snapshot_store(name, x, 1);
}

static inline void __snap_ulong(const char *name, unsigned long x) {
  __trace_snapshot_store(name, (long long)x, 1);
}

static inline void __snap_uchar(const char *name, unsigned char x) {
  __trace_snapshot_store(name, x, 1);
}

static inline void __snap_int16(const char *name, int16_t x) {
  __trace_snapshot_store(name, x, 1);
}

static inline void __snap_char_ptr(const char *name, char *p) {
  __trace_snapshot_store(name, p ? (long long)(unsigned char)(*p) : -1,
                         p != NULL);
}

static inline void __snap_const_char_ptr(const char *name, const char *p) {
  __trace_snapshot_store(name, p ? (long long)(unsigned char)(*p) : -1,
                         p != NULL);
}

static inline void __snap_uchar_ptr(const char *name, unsigned char *p) {
  __trace_snapshot_store(name, p ? (long long)(*p) : 0, p != NULL);
}

static inline void __snap_const_uchar_ptr(const char *name,
                                          const unsigned char *p) {
  __trace_snapshot_store(name, p ? (long long)(*p) : 0, p != NULL);
}

static inline void __snap_uint64_ptr(const char *name, const uint64_t *p) {
  __trace_snapshot_store(name, p ? (long long)(*p) : 0, p != NULL);
}

static inline void __snap_const_uint64_ptr(const char *name,
                                           const uint64_t *p) {
  __trace_snapshot_store(name, p ? (long long)(*p) : 0, p != NULL);
}

static inline void __snap_int16_ptr(const char *name, int16_t *p) {
  __trace_snapshot_store(name, p ? (long long)(*p) : -1, p != NULL);
}

static inline void __snap_const_int16_ptr(const char *name, const int16_t *p) {
  __trace_snapshot_store(name, p ? (long long)(*p) : -1, p != NULL);
}

static inline void __snap_unknown(const char *name, ...) {
  __trace_snapshot_store(name, 0, 0);
}

/* ---------- dispatch ---------- */
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
      default: __snap_unknown)

/* ---------- FOR_EACH ---------- */
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

/* ---------- optional-parentheses detection ----------
 * Standard preprocessor trick: __MBC_IS_PAREN(x) expands to 1 if x is
 * syntactically "(...)", else 0. Lets PRINT_ARGS accept either a bare
 * "NAME" (single output, existing call-site syntax preserved exactly)
 * or a parenthesized ("A","B",...) list (multi-output), with no change
 * required at call sites that only ever had one output.
 */
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

/* If x is already "(...)", leave it as-is; otherwise wrap it: x -> (x) */
// #define __MBC_WRAP_IF_NEEDED(x) __MBC_IIF(__MBC_IS_PAREN(x))(x, (x))

/* ---------- user macros ---------- */

/*
 * Wrap an output name to mark it as "also input" (i.e. an in-place
 * argument): INOUT("r") instead of "r". Works both as the sole
 * output_args value and as one element inside a parenthesized
 * multi-output list, e.g. ("VL", INOUT("VP1V")).
 *
 * Relies on the compiler concatenating adjacent string literals:
 * INOUT("r") expands to "*" "r", which becomes the single literal
 * "*r"; json_output_array strips the leading '*' before writing
 * "output" and uses it to know it should also look for a snapshot.
 */
#define INOUT(name) "*" name

#define TRACE_DISTRIBUTION(arg_name, arg_description)                          \
  do {                                                                         \
    if (__trace_distribution_count < TRACE_MAX_DISTRIBUTIONS) {                \
      __trace_distributions[__trace_distribution_count].name = (arg_name);     \
      __trace_distributions[__trace_distribution_count].description =          \
          (arg_description);                                                   \
      __trace_distribution_count++;                                            \
    }                                                                          \
  } while (0)

/*
 * Record the pre-mutation value of x, to be used later by an INOUT(...)
 * output in the same function's PRINT_ARGS call. Call this BEFORE the
 * function mutates x (normally the first line of the function). Uses
 * the stringified expression x as the lookup key, so it should match
 * exactly what you pass to INOUT(...), e.g.:
 *
 *   TRACE_SNAPSHOT(r);
 *   ...
 *   PRINT_ARGS("f", INOUT("r"), r);
 *
 * If x's type isn't directly supported (e.g. a struct pointer like
 * poly *) use TRACE_SNAPSHOT_AS with an explicit name and a supported
 * sub-expression instead, see below.
 */

/*
 * Same as TRACE_SNAPSHOT, but lets you give an explicit lookup name
 * that differs from the expression being sampled. This is needed
 * whenever the mutated argument's own type isn't one PRINT_ARG/
 * TRACE_SNAPSHOT understands (e.g. `poly *r`, where the JSON output
 * name is "r" but the value has to come from a supported sub-object
 * such as r->coeffs):
 *
 *   TRACE_SNAPSHOT_AS("r", r->coeffs);
 *   ntt(*r);
 *   poly_reduce(r);
 *   PRINT_ARGS("poly_ntt", INOUT("r"), r->coeffs);
 */
#if KYBER_K == 3
#define TRACE_SNAPSHOT(x) __SNAPSHOT_DISPATCH(x)(#x, (x))
#define TRACE_SNAPSHOT_AS(name, x) __SNAPSHOT_DISPATCH(x)(name, (x))
#else
#define TRACE_SNAPSHOT(x)                                                      \
  do {                                                                         \
  } while (0)
#define TRACE_SNAPSHOT_AS(name, x)                                             \
  do {                                                                         \
  } while (0)
#endif

/*
 * output_args accepts either:
 *   "NAME"                  -- single output (unchanged existing syntax)
 *   ("NAME1", "NAME2", ...) -- two or more outputs
 * and any NAME may be wrapped in INOUT(...) to mark it as an in-place
 * (also-input) argument, which additionally emits "<NAME>_in" sourced
 * from a prior TRACE_SNAPSHOT/TRACE_SNAPSHOT_AS call.
 *
 * Examples:
 *   PRINT_ARGS("compute_P3", "P3", p, P1, P2, O, P3);
 *   PRINT_ARGS("compute_M_and_VPV", ("VL", "VP1V"), p, Vdec, L, P1, VL, VP1V);
 *   PRINT_ARGS("poly_ntt", INOUT("r"), r->coeffs);
 *
 * Each PRINT_ARGS call appends at most one line to
 * ../function_inputs/<funcname>.json; once that file already holds
 * TRACE_MAX_ENTRIES lines, further calls for that function are
 * silently rejected (json_begin leaves __trace_file NULL, so nothing
 * is written and no file handle is opened).
 */
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