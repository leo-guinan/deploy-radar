#!/bin/bash
set -e

# Initialize and update submodules if needed
git submodule update --init --recursive

# Navigate to backend directory
cd radar-backend

curl -sSL https://install.python-poetry.org | python3 -

# Build the Docker image
poetry config virtualenvs.create false
poetry install --no-dev --no-interaction --no-ansi

echo "Backend build complete!"
