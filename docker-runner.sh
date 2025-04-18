#!/bin/bash

# --- Configuration ---
COMPOSE_FILE="docker-compose.yml" # The name of your docker-compose.yml file
DB_INIT_DIR="./db_init"          # Directory containing database initialization scripts
APP_SERVICE_NAME="makani-helpdesk-api" # Name of your application service\
# --- Functions ---

# Function to update database (using initialization scripts)
# WARNING: This will likely wipe existing data!
update_db_init() {
    echo "--- Updating database (using init scripts) ---"
    docker stop makani-mariadb
    docker rm makani-mariadb
    docker volume ls # List all volumes to find the one associated with MariaDB
    docker volume rm makani-helpdesk-api_db_data
    docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d makani-mariadb
    echo "--- Database updated (using init scripts) ---"
}

run_dev() {
    echo "--- Running only the application service (rebuilding image with --no-cache dev profile) ---"
    # Check if port 8080 is in use (Linux/macOS example)
    if netstat -tuln | grep ":8080\b"; then
        echo "Port 8080 is already in use. Please stop the conflicting process."
        exit 1
    fi

    # 1. Rebuild the application image (to pick up code and Dockerfile changes)
    docker-compose -f "$COMPOSE_FILE" build "$APP_SERVICE_NAME"

    # 2. Recreate the application container (to pick up docker-compose.yml changes)
    docker-compose -f "$COMPOSE_FILE" up "$APP_SERVICE_NAME"
}

# --- Main Script ---

echo "Choose an action:"
echo "1. Run application in DEV mode - if not db container running, start db first"
echo "2. Start DB or Update schema"
echo "q. Quit"
read -p "Enter your choice: " choice

case "$choice" in
    1)
      echo "--- run app on dev mode ---"
      run_dev
      ;;
   2)
      # Update database using initialization scripts (DATA LOSS WARNING)
      echo "--- use when database schema has changed ---"
      update_db_init
      ;;
   q)
      # Quit the script
      echo "Quitting."
      exit 0
      ;;
   *)
      # Handle invalid user input
      echo "Invalid choice."
      exit 1
      ;;
esac

echo "Done."