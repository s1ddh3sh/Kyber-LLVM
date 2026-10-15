#!/usr/bin/env bash
#
# run_smt_queries.sh -- SMT counterpart of
# test_qemu/dist_tests/kyber/run_combined_unicorn.sh: runs the ineffective
# and the correction query for one Kyber function against every faulty
# trace under tests_kyber/<func>/{loopOrFuncSkip,binOpFault,loadStoreSkip}/.
# Generate the traces first with  fault-types/run_faults.sh <func>.
#
# Parameters are taken from the same files as the simulation:
#   ../../test_qemu/kyber.json             secret-buf, eph_secret, fixed-scalars
#   tests_kyber/<func>/qemu_witness.json   argument layout + distributions
#   tests_kyber/<func>/active_lengths.json active bytes per input
#
# Results land next to the simulation's test_result.txt, per fault:
#   tests_kyber/<func>/<category>/<fault>/{ineffective,correction}_smt_result.txt
# and a summary table (with the simulation's verdict, if it has been run)
# is printed at the end.
#
# Usage:
#   ./smt_queries/run_smt_queries.sh <func_name> [query options]
#   e.g. ./smt_queries/run_smt_queries.sh pqcrystals_kyber768_ref_polyvec_add
#        ./smt_queries/run_smt_queries.sh pqcrystals_kyber768_ref_poly_tomsg \
#            --jobs 8 --timeout 120000
# Query options (passed to both): --secret-buf NAME --secret-pos POS
#   --field-mod N --out-buf NAME|all --out-word-size N --diff-mode xor|mod-sub
#   --modulus N --kyber-k K --fault SUBSTR --positions N --jobs N
#   --timeout MS --fault-timeout S --verbose

set -euo pipefail

if [[ $# -lt 1 || "$1" == --* ]]; then
    echo "Usage: $0 <func_name> [query options]" >&2
    exit 1
fi
FUNC_NAME="$1"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUILD_DIR="${SCRIPT_DIR}/build"
LLVM_DIR="$(dirname "$SCRIPT_DIR")"
TEST_DIR="${LLVM_DIR}/tests_kyber"
KYBER_JSON="${KYBER_JSON:-${LLVM_DIR}/../../test_qemu/kyber.json}"

cmake -S "$SCRIPT_DIR" -B "$BUILD_DIR" -DCMAKE_BUILD_TYPE=Release > /dev/null
cmake --build "$BUILD_DIR" -j > /dev/null

ARGS=("$@" --test-dir "$TEST_DIR" --kyber-json "$KYBER_JSON")

STATUS=0
echo "########## [1/2] ineffective SMT query ##########"
"${BUILD_DIR}/ineffective_query" "${ARGS[@]}" || STATUS=1
echo ""
echo "########## [2/2] correction SMT query ##########"
"${BUILD_DIR}/correction_query" "${ARGS[@]}" || STATUS=1

# ---------------------------------------------------------------------------
# Summary, in the same shape as run_combined_unicorn.sh's (SIM columns from
# the simulation's test_result.txt for the same fault, when present).
# ---------------------------------------------------------------------------
verdict() { # file, test name, hit word
    local f="$1" t="$2" hit="$3"
    [[ -f "$f" ]] || { echo "-"; return; }
    if grep -q "^\[RESULT\] $t test: $hit" "$f"; then echo "$hit"
    elif grep -q "^\[RESULT\] $t test: UNKNOWN" "$f"; then echo "UNKNOWN"
    elif grep -q "^\[RESULT\] $t test: ERROR" "$f"; then echo "ERROR"
    elif grep -q "TimeoutExpired" "$f"; then echo "TIMEOUT"
    elif grep -q "^\[RESULT\] $t test:" "$f"; then echo "no"
    else echo "-"; fi
}
FN_DIR="${TEST_DIR}/${FUNC_NAME}"
echo ""
echo "########## summary: ${FUNC_NAME} ##########"
printf "%-70s %-12s %-12s %-12s %-12s\n" "FAULT" "INEFF(SMT)" "INEFF(SIM)" "CORR(SMT)" "CORR(SIM)"
while IFS= read -r -d '' smt2; do
    rel="${smt2#${FN_DIR}/}"
    stem="${rel%.smt2}"
    d="${FN_DIR}/${stem}"
    printf "%-70s %-12s %-12s %-12s %-12s\n" "$stem" \
        "$(verdict "$d/ineffective_smt_result.txt" ineffective DETECTED)" \
        "$(verdict "$d/test_result.txt" ineffective DETECTED)" \
        "$(verdict "$d/correction_smt_result.txt" correction SATISFIED)" \
        "$(verdict "$d/test_result.txt" correction SATISFIED)"
done < <(find "$FN_DIR"/loopOrFuncSkip "$FN_DIR"/binOpFault "$FN_DIR"/loadStoreSkip \
              -name '*.smt2' -not -path '*full_kyber_gated*' -print0 2>/dev/null | sort -z)
exit "$STATUS"
