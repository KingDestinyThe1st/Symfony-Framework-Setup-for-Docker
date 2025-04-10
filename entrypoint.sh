#!/bin/bash

echo "Starting Symfony CLI server..."


source .env

# Function to start the Symfony CLI server
start_symfony() {
  echo "Starting Symfony CLI server..."
  symfony server:start --port="$PORT" --allow-all-ip
}

# Function to stop the Symfony CLI server
stop_symfony() {
  echo "Stopping Symfony CLI server..."
  symfony server:stop
}

# Trap signals for graceful shutdown
trap stop_symfony SIGINT SIGTERM

# Start the Symfony CLI server in the background
start_symfony &

# Wait for the background process to finish (which should be never, unless an error occurs)
wait $!

# If the script reaches this point, it means the server has stopped unexpectedly.
echo "Symfony CLI server stopped unexpectedly."