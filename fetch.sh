#!/bin/bash
set -euo pipefail
SCRIPT_DIR=$(realpath "$(dirname "$0")")

if [[ $# != 1 ]]; then
  echo "Please provide a day number."
  echo "usage: $0 DAY"
  exit 1
fi

if [[ ! "$1" =~ ^(0[1-9]|1[0-9]|2[0-5])$ ]]; then
  echo "Argument '$1' is not a valid day."
  exit 1
fi

if [[ -z "${AOC_SESSION-""}" ]]; then
  echo "No session token set in \$AOC_SESSION."
  exit 1
fi

mkdir -p "$SCRIPT_DIR/inputs"

curl -s "https://adventofcode.com/2022/day/${1#0}/input" \
    --cookie "session=$AOC_SESSION" \
    -A "Bash script at $(git remote -v | head -n1 | awk '{print $2}')" \
    | tee "$SCRIPT_DIR/inputs/$1.in"
