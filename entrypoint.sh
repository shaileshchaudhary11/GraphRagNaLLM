#!/bin/bash
set -e

# Start the Ollama service
ollama serve &

# Wait for the service to start (you might need to adjust the sleep duration)
sleep 10

# Run the desired command
ollama run mistral

# Keep the container running
tail -f /dev/null
