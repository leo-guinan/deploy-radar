#!/bin/bash

# Initialize and update submodules if needed
git submodule update --init --recursive

# Navigate to backend directory
cd radar-backend

# Build the Docker image
poetry install --no-dev

echo "Backend build complete!"
