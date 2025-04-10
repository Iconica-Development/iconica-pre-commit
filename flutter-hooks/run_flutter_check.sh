#!/bin/bash
set -e

ROOT_DIR="$(git rev-parse --show-toplevel)"
cd "$ROOT_DIR"

DIRS=("$@")
if [ ${#DIRS[@]} -eq 0 ]; then
  DIRS=(".")
fi

for DIR in "${DIRS[@]}"; do
  echo "Running dart format on $DIR"
  dart format "$DIR"

  echo "Running flutter analyze on $DIR"
  flutter analyze "$DIR"
done