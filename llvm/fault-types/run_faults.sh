#!/usr/bin/env bash
#
# run_faults.sh
#
# Usage:
#   ./run_faults.sh add_f mat_add ...
#   (Automatically assumes files are in ../taintResults/ and end in .json if not fully specified)
#
# For each entry in each JSON file:
#   - type == "CallInst"  -> ./loop_fn_Fault <ir_file> 1 <basename> <callee>
#   - type == "BinOp"     -> ./binOpFault <ir_file> <basename> <line_no>
#   - anything else       -> skipped (with a warning)
#
# Requires: jq

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <json_file> [<json_file> ...]" >&2
  exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: jq is required but not installed." >&2
  exit 1
fi

IR_FILE="../../kyber_IR/kyber768.ll"
DEFAULT_DIR="../taintResults"

# Resolve all json file paths to absolute *before* we cd into build,
# since relative paths on the command line are relative to the caller's cwd.
declare -a JSON_FILES=()
for input in "$@"; do
  target_file="$input"
  
  # If the input isn't an existing file, try resolving it via the default path
  if [ ! -f "$target_file" ]; then
    # Append .json extension if it's missing
    if [[ "$target_file" != *.json ]]; then
      target_file="${target_file}.json"
    fi
    # Prefix with the default directory
    target_file="${DEFAULT_DIR}/${target_file}"
  fi

  # Final check to ensure the resolved file actually exists
  if [ ! -f "$target_file" ]; then
    echo "Warning: file not found, skipping: $input (resolved to $target_file)" >&2
    continue
  fi

  JSON_FILES+=("$(realpath "$target_file")")
done

if [ ${#JSON_FILES[@]} -eq 0 ]; then
  echo "Error: no valid JSON files given." >&2
  exit 1
fi

mkdir -p build && cd build
make -j$(nproc)
for jsonfile in "${JSON_FILES[@]}"; do
  filename="$(basename "$jsonfile" .json)"

  echo "=== Processing $filename ($jsonfile) ==="

  # Get all top-level keys (line numbers) in the JSON object
  mapfile -t keys < <(jq -r 'keys[]' "$jsonfile")

  for line_no in "${keys[@]}"; do
    type=$(jq -r --arg k "$line_no" '.[$k].type' "$jsonfile")

    case "$type" in
      CallInst)
        callee=$(jq -r --arg k "$line_no" '.[$k].callee' "$jsonfile")
        if [ -z "$callee" ] || [ "$callee" = "null" ]; then
          echo "  [skip] line $line_no: CallInst with no resolvable callee (indirect call)" >&2
          continue
        fi
        echo "  [run] ./loop_fn_Fault $IR_FILE 1 $filename $line_no"
        ./loop_fn_Fault "$IR_FILE" 1 "$filename" "$line_no"
        ;;

      BinOp)
        echo "  [run] ./binOp_load_store_Fault $IR_FILE $filename $line_no"
        ./binOp_load_store_Fault "$IR_FILE" "$filename" "$line_no"
        ;;

      *)
        echo "  [skip] line $line_no: type=$type has no matching fault binary" >&2
        ;;
    esac
  done
done