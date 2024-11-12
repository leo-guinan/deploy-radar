#!/bin/bash

# Initialize and update submodules
git submodule update --init --recursive

# Build frontend
cd project
npm install
npm run build

# Copy frontend build to deployment directory
mkdir -p /var/www/html
cp -r dist/* /var/www/html/

# Build and start backend
cd ../demo-server

# Create database if it doesn't exist
if [ ! -f ".db-created" ]; then
    psql "$DATABASE_URL" -f setup.sql
    touch .db-created
fi

# Install dependencies and start server
poetry install --no-dev
poetry run uvicorn main:app --host 0.0.0.0 --port 3001 