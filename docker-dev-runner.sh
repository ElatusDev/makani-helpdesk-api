#!/bin/bash

# --- Configuration ---
COMPOSE_FILE="docker-compose.dev.yml" # The name of your docker-compose.yml file
DB_INIT_DIR="./db_init"          # Directory containing database initialization scripts
APP_SERVICE_NAME="makani-helpdesk-api" # Name of your application service\
DB_SERVICE_NAME="makani-mariadb" # Define DB service name for clarity

# --- Functions ---

# Function to update database (using initialization scripts)
# WARNING: This will likely wipe existing data!
update_db_init() {
    echo "--- Updating database (using init scripts) ---"
    # Check if container exists
    if docker ps -aq --filter name=makani-mariadb | grep -q .; then
        echo "Stopping existing container: makani-mariadb"
        docker stop makani-mariadb
        echo "Removing existing container: makani-mariadb"
        docker rm makani-mariadb
    else
        echo "Container 'makani-mariadb' does not exist."
    fi

    # Validate and remove volume if it exists
    volume_name="makani-helpdesk-api_db_data"
    if docker volume ls --filter name="$volume_name" | grep -q "$volume_name"; then
        echo "Removing existing volume: $volume_name"
        docker volume rm "$volume_name"
    else
        echo "Volume '$volume_name' does not exist. check naming, volume should always be present"
    fi

    echo "--- Starting database with fresh volume ---"
    docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d "$DB_SERVICE_NAME"

    # --- Wait for MariaDB to become healthy/initialized ---
        echo "Waiting for MariaDB container to start and initialize (up to 5 seconds)..."
        # Check if a healthcheck is defined in your docker-compose.dev.yml for makani-mariadb
        # If not, the 'healthy' status won't be available, and you might need to rely more on sleep and logs.

        START_TIME=$(date +%s)
        TIMEOUT=5 # Max seconds to wait for DB to be healthy/ready

        # Loop to check container status and health
        while true; do
            CURRENT_TIME=$(date +%s)
            ELAPSED_TIME=$((CURRENT_TIME - START_TIME))

            if [ "$ELAPSED_TIME" -ge "$TIMEOUT" ]; then
                echo "Error: MariaDB did not become healthy/ready within $TIMEOUT seconds."
                echo "Last known status of $DB_SERVICE_NAME:"
                docker-compose -f "$COMPOSE_FILE" ps "$DB_SERVICE_NAME"
                echo "--- Displaying MariaDB logs (last 50 lines) for debugging ---"
                docker logs "$DB_SERVICE_NAME" | tail -n 50
                exit 1
            fi
        done
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