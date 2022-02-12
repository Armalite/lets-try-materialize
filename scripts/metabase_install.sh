#!/bin/bash

echo "Writing a GUI interface in Visual Basic to track the IP address..."
hostip=$(ip addr show eth0 | awk '$1 == "inet" {gsub(/\/.*$/, "", $2); print $2}')
echo "Host IP found as: ${hostip}"

echo "Starting Metabase container..."
docker run -d -p 3000:3000 \
-v /metabase-data:/metabase-data \
-e "MB_DB_FILE=/metabase-data/metabase.db" \
--name metabase metabase/metabase

echo "## Metabase container started"
echo "# Set up a database connection in Metabase with the following details:"
echo "Display Name: lets-try-materialize"
echo "Host: ${hostip}"
echo "Port: 6875"
echo "Database Name: Materialize"
echo "Username: Materialize"
echo "Password: Materialize"