#!/bin/bash

# --- Configuration ---
COMPOSE_FILE="docker-compose.dev.yml"
DB_INIT_DIR="./db_init"
APP_SERVICE_NAME="makani-helpdesk-api"
DB_SERVICE_NAME="makani-mariadb"
REDIS_SERVICE_NAME="redis"
CA_SERVICE_NAME="makani-ca"

# --- Functions ---
run_local() {
  SPRING_PROFILES_ACTIVE="local"

  echo "--- Running application in LOCAL mode (for IDE debugging) ---"
  if [ -f .env ]; then
    echo "Loading local environment variables..."
    export $(grep -v '^#' .env | xargs)
    echo "Environment variables loaded."
  else
    echo "Error: .env file not found. Please create it."
  fi

  # Check for DB container
    if ! docker-compose -f "$COMPOSE_FILE" ps "$DB_SERVICE_NAME" | grep -q "$DB_SERVICE_NAME"; then
        _start_db
    fi

    # Check for Redis container
    if ! docker-compose -f "$COMPOSE_FILE" ps "$REDIS_SERVICE_NAME" | grep -q "$REDIS_SERVICE_NAME"; then
        _start_redis
    fi

    # Check for CA container
    if ! docker-compose -f "$COMPOSE_FILE" ps "$CA_SERVICE_NAME" | grep -q "$CA_SERVICE_NAME"; then
        _start_ca
    fi
}

_start_db() {
    local volume_name="makani-helpdesk-api_db_data"
    # Check and remove existing DB container and volume
    if docker-compose -f "$COMPOSE_FILE" ps -q "$DB_SERVICE_NAME" | grep -q .; then
        echo "Stopping and removing existing container: $DB_SERVICE_NAME"
        docker-compose -f "$COMPOSE_FILE" stop "$DB_SERVICE_NAME"
        docker-compose -f "$COMPOSE_FILE" rm -f "$DB_SERVICE_NAME"
    fi
    if docker volume ls --filter name="$volume_name" | grep -q "$volume_name"; then
        echo "Removing existing DB volume: $volume_name"
        docker volume rm "$volume_name"
    fi


    docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d "$DB_SERVICE_NAME"
    echo "Waiting for MariaDB to be ready (up to 10 seconds)..."
    sleep 10
    # --- CRITICAL FIX: Add a log command here to display the initialization process ---
    echo "--- Displaying MariaDB initialization logs (this may take a moment) ---"
    docker-compose -f "$COMPOSE_FILE" logs -f "$DB_SERVICE_NAME" & # Run in the background
    LOG_PID=$! # Capture the PID of the logs command
}

_start_redis() {
    echo "--- Starting Redis service ---"
    local volume_name="makani-helpdesk-api_redis_data"
    if docker-compose -f "$COMPOSE_FILE" ps -q "$REDIS_SERVICE_NAME" | grep -q .; then
        echo "Stopping and removing existing container: $REDIS_SERVICE_NAME"
        docker-compose -f "$COMPOSE_FILE" stop "$REDIS_SERVICE_NAME"
        docker-compose -f "$COMPOSE_FILE" rm -f "$REDIS_SERVICE_NAME"
    fi
    if docker volume ls --filter name="$volume_name" | grep -q "$volume_name"; then
        echo "Removing existing Redis volume: $volume_name"
        docker volume rm "$volume_name"
    fi
    docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d "$REDIS_SERVICE_NAME"
    echo "Redis service is up."
}

_start_ca() {
    echo "--- Starting Certificate Authority service ---"
    local volume_name="makani-helpdesk-api_ca_certs"
    if docker-compose -f "$COMPOSE_FILE" ps -q "$CA_SERVICE_NAME" | grep -q .; then
        echo "Stopping and removing existing container: $CA_SERVICE_NAME"
        docker-compose -f "$COMPOSE_FILE" stop "$CA_SERVICE_NAME"
        docker-compose -f "$COMPOSE_FILE" rm -f "$CA_SERVICE_NAME"
    fi
    if docker volume ls --filter name="$volume_name" | grep -q "$volume_name"; then
        echo "Removing existing CA volume: $volume_name"
        docker volume rm "$volume_name"
    fi
    docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d "$CA_SERVICE_NAME"
    echo "Waiting for CA service to generate certificate..."

    docker-compose -f "$COMPOSE_FILE" logs "$CA_SERVICE_NAME" | grep "certificate and key have been generated";
    echo "CA service is up and certificate is ready."
}

# --- Main Functions for runner actions ---

update_db_init() {
    echo "--- Use when database schema has changed (DATA LOSS WARNING) ---"
    _start_db
}


run_dev() {
  SPRING_PROFILES_ACTIVE="dev"
    echo "--- Running application in DEV mode ---"

    # Check for DB container
    if ! docker-compose -f "$COMPOSE_FILE" ps "$DB_SERVICE_NAME" | grep -q "$DB_SERVICE_NAME"; then
        _start_db
    fi

    # Check for Redis container
    if ! docker-compose -f "$COMPOSE_FILE" ps "$REDIS_SERVICE_NAME" | grep -q "$REDIS_SERVICE_NAME"; then
        _start_redis
    fi

    # Check for CA container
    if ! docker-compose -f "$COMPOSE_FILE" ps "$CA_SERVICE_NAME" | grep -q "$CA_SERVICE_NAME"; then
        _start_ca
    fi

    # Rebuild the application image
    echo "Rebuilding the application image: $APP_SERVICE_NAME"
    docker-compose -f "$COMPOSE_FILE" build "$APP_SERVICE_NAME"

    # Start the application service, which depends on the others
    echo "Starting application service: $APP_SERVICE_NAME"
    docker-compose -f "$COMPOSE_FILE" up -d "$APP_SERVICE_NAME"
}

# --- Main Script ---
echo "Choose an action:"
echo "1. Run in DEV mode"
echo "2. Start DB or Update schema"
echo "3. Run in local mode (debugging)"
echo "q. Quit"
read -p "Enter your choice: " choice

case "$choice" in
    1)
      echo "--- Running app in DEV mode ---"
      run_dev
      ;;
   2)
      echo "--- Use when database schema has changed (DATA LOSS WARNING) ---"
      update_db_init
      ;;
   3)
     echo "---- Run app in LOCAL mode (for IDE debugging)"
     run_local
     ;;
   q)
      echo "Quitting."
      exit 0
      ;;
   *)
      echo "Invalid choice."
      exit 1
      ;;
esac

echo "Done."