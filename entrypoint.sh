#!/bin/bash
# Stop on any error
set -e

echo "Starting Source Document Ingest"
synthetic-data-kit --config /app/data/config.yaml "ingest" "/app/data/input/"

echo "Generating QA Pairs"
synthetic-data-kit --config /app/data/config.yaml "create" "/app/data/parsed/" "--type" "qa"

echo "Generating Chain of Thought Reasoning"
synthetic-data-kit --config /app/data/config.yaml "create" "/app/data/parsed/" "--type" "cot"

echo "Curatating QA Pairs"
synthetic-data-kit --config /app/data/config.yaml "curate" "/app/data/generated/" "--threshold" "8.0"

echo "Saving Curated Data"
synthetic-data-kit --config /app/data/config.yaml "save-as" "/app/data/curated/" "--format" "alpaca"

echo "Pipeline Complete!"
