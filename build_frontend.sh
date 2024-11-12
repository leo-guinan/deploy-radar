#!/bin/bash
set -e

# Initialize and update submodules
git submodule update --init --recursive

# Navigate to frontend directory
cd radar-frontend

# Install dependencies and build
npm install
npm run build

echo "Frontend build complete!"
