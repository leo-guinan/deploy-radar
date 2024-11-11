#!/bin/bash

# Build frontend
cd ../project
npm run build

# Copy frontend build to deployment directory
mkdir -p /var/www/html
cp -r dist/* /var/www/html/

# Build and start backend
cd ../demo-server
poetry install --no-dev
poetry run uvicorn main:app --host 0.0.0.0 --port 3001
