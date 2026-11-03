#!/usr/bin/env bash
#
# fuseback_gen.sh — fuse each per-function faulty (and correct) .ll back into
# the whole Kyber program, producing gated whole-program .ll under
# tests_kyber/<func>/**/full_kyber/.
#
# Fusing the unmodified tests_kyber/<func>/<func>.ll yields the CORRECT gated
# build (full_kyber/kyber_<func>.ll); fusing each faulty variant yields the
# faulty gated builds. The build script then compiles them to ELFs.
#
# Usage:
#   ./fuseback_gen.sh                # fuse every function dir under tests_kyber/
#   ./fuseback_gen.sh <func_name>    # fuse just one function dir
#
# Paths are anchored to this script's location, so it runs correctly from any
# working directory.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_LL="${SCRIPT_DIR}/../kyber_IR/kyber768.ll"
RESULTS_DIR="${SCRIPT_DIR}/../tests_kyber"
FUSEBACK="${SCRIPT_DIR}/build/fuse_back"

if [[ ! -x "$FUSEBACK" ]]; then
    echo "Error: $FUSEBACK not found or not executable." >&2
    echo "       build it first: (cd ${SCRIPT_DIR}/build && cmake --build . --target fuse_back)" >&2
    exit 1
fi
[[ -f "$BASE_LL" ]] || { echo "Error: base IR not found: $BASE_LL" >&2; exit 1; }

# Select which function directories to fuse.
TARGET="${1:-}"
dirs=()
if [[ -n "$TARGET" ]]; then
    [[ -d "${RESULTS_DIR}/${TARGET}" ]] || { echo "Error: no such function dir: ${RESULTS_DIR}/${TARGET}" >&2; exit 1; }
    dirs=( "${RESULTS_DIR}/${TARGET}" )
else
    for d in "$RESULTS_DIR"/*/; do
        [[ -d "$d" ]] && dirs+=( "${d%/}" )
    done
fi

for func_dir in "${dirs[@]}"; do
    func_name=$(basename "$func_dir")
    echo "==============================="
    echo "Function: $func_name"
    echo "==============================="

    # Fuse every source .ll EXCEPT ones already under a full_kyber/ dir
    # (those are fusing outputs, not inputs -- re-fusing them would nest).
    while IFS= read -r -d '' llfile; do
        echo "Processing: $llfile"
        "$FUSEBACK" "$BASE_LL" "$llfile" "$func_name"
    done < <(find "$func_dir" -type f -name "*.ll" -not -path '*full_kyber*' -print0)
done

echo "Done."
