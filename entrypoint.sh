#!/bin/bash
set -e

echo "Starting LiteLLM Proxy..."

# Build startup command
CMD_ARGS="--config /app/config.yaml --port 4000"

if [ -n "$NUM_WORKERS" ]; then
    CMD_ARGS="$CMD_ARGS --num_workers $NUM_WORKERS"
fi

echo "Launching LiteLLM with: $CMD_ARGS"
exec litellm $CMD_ARGS
