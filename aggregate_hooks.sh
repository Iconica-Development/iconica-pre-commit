#!/bin/bash
# This script aggregates all .pre-commit-hooks.yaml files into the main one
# Usage: ./aggregate_hooks.sh

MAIN_FILE=".pre-commit-hooks.yaml"
> "$MAIN_FILE"

# Aggregate hooks from each subfolder
for dir in */; do
    if [ -f "$dir/.pre-commit-hooks.yaml" ]; then
        echo "Adding hooks from $dir/.pre-commit-hooks.yaml"
        cat "$dir/.pre-commit-hooks.yaml" >> "$MAIN_FILE"
        echo -e "\n" >> "$MAIN_FILE"  # Add a newline for separation
    fi
done

echo "Aggregation complete. All hooks added to $MAIN_FILE."