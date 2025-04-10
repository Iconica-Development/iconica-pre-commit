#!/bin/bash
set -e

DIR="${1:-.}"

echo "Running 'melos run pre-commit' in $DIR"
cd "$DIR"
melos run pre-commit