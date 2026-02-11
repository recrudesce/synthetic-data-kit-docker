#!/bin/bash
# Stop on any error
set -e

echo "Starting Ingest..."
synthetic-data-kit --config /app/data/config.yaml "ingest" "/app/data/input/"

echo "Starting Create..."
synthetic-data-kit --config /app/data/config.yaml "create" "/app/data/parsed/" "--type" "qa"

echo "Starting Curate..."
synthetic-data-kit --config /app/data/config.yaml "curate" "/app/data/generated/" "--threshold" "8.0"

echo "Starting Save-as..."
synthetic-data-kit --config /app/data/config.yaml "save-as" "/app/data/curated/" "--format" "alpaca"

echo "Pipeline Complete!"
