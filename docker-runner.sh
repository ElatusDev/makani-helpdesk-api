#!/bin/bash

# --- Configuration ---
COMPOSE_FILE="docker-compose.yml" # The name of your docker-compose.yml file
DB_INIT_DIR="./db_init"          # Directory containing database initialization scripts
APP_SERVICE_NAME="makani-helpdesk-api" # Name of your application service

# --- Functions ---

# Function to rebuild images and recreate containers
update_app() {
    echo "--- Rebuilding images and recreating containers (QA profile) ---"
    docker-compose -f "$COMPOSE_FILE" build --no-cache  # Rebuild images, ignoring the cache
    docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d -e SPRING_PROFILES_ACTIVE=qa # Recreate containers, even if config hasn't changed
    echo "--- App updated ---"
}

# Function to update database (using initialization scripts)
# WARNING: This will likely wipe existing data!
update_db_init() {
    echo "--- Updating database (using init scripts) ---"
    docker-compose -f "$COMPOSE_FILE" down -v  # Stop and remove containers, volumes, and networks (including volumes - DATA LOSS!)
    docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d -e SPRING_PROFILES_ACTIVE=qa # Recreate everything
    echo "--- Database updated (using init scripts) ---"
}

# Function to run only the application service (e.g., for local development)
run_app_only() {
    echo "--- Running only the application service (rebuilding image with --no-cache and setting dev profile) ---"
    # Check if port 8080 is in use (Linux/macOS example)
    if netstat -tulnp | grep :8080; then
        echo "Port 8080 is already in use. Please stop the conflicting process."
        exit 1
    fi
    # 1. Rebuild the application image (to pick up code and Dockerfile changes)
    docker-compose -f "$COMPOSE_FILE" build --no-cache "$APP_SERVICE_NAME"

    # 2. Recreate the application container (to pick up docker-compose.yml changes)
    docker-compose -f "$COMPOSE_FILE" up --force-recreate -d "$APP_SERVICE_NAME"

    # 3. Run the application service, setting the dev profile and mapping ports
    #    Note: 'run' is generally better for one-off dev runs, but 'up' might be needed
    #    if you have other services that the app depends on.
    #    If using 'run', remove the 'up' command above.
    docker-compose -f "$COMPOSE_FILE" run --rm \
        -e SPRING_PROFILES_ACTIVE=dev \
        "$APP_SERVICE_NAME"

    echo "--- Application service running in dev mode ---"
}

# --- Main Script ---

echo "Choose an action:"
echo "1. Update application (rebuild images, recreate containers, QA profile)"
echo "2. Update database (using init scripts - WARNING: DATA LOSS!, QA profile)"
echo "3. Update all (application and database - WARNING: DATA LOSS!, QA profile)"
echo "4. Just rebuild images"
echo "5. Just recreate containers (no rebuild, QA profile)"
echo "6. Down and Up (forceful refresh, including volume removal - DANGER: DATA LOSS!, QA profile)"
echo "7. Run application service only (dev profile)"
echo "q. Quit"
read -p "Enter your choice: " choice

case "$choice" in
    1)
        # Update application only
        update_app
        ;;
    2)
        # Update database using initialization scripts (DATA LOSS WARNING)
        echo "--- use when database schema has changed ---"
        update_db_init
        ;;
    3)
        # Update both application and database (DATA LOSS WARNING)
        update_app
        update_db_init
        ;;
    4)
        # Rebuild images only (useful if Dockerfile or code changed)
        echo "--- Rebuilding images (no cache) use if Dockerfile or code changed ---"
        docker-compose -f "$COMPOSE_FILE" build --no-cache
        echo "--- Images rebuilt ---"
        ;;
    5)
        # Recreate containers only (useful if docker-compose.yml configuration changed)
        echo "--- Recreating containers (no rebuild, QA profile) ---"
        docker-compose -f "$COMPOSE_FILE" up --force-recreate -d -e SPRING_PROFILES_ACTIVE=qa
        echo "--- Containers recreated ---"
        ;;
    6)
        # Forceful refresh by stopping and removing everything (including volumes - DATA LOSS WARNING)
        echo "--- Down and Up (including volume removal) ---"
        docker-compose -f "$COMPOSE_FILE" down -v
        docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d -e SPRING_PROFILES_ACTIVE=qa
        echo "--- System refreshed ---"
        ;;
    7)
        # Run only the application service (e.g., for local development)
        run_app_only
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

# --- Explanation of 'rebuild' and 'recreate' ---
#
# - **Image:** A Docker image is a template or blueprint for creating containers.
#   It includes everything needed to run an application (code, runtime, libraries, etc.).
#
# - **Container:** A running instance of a Docker image.
#
# - **Rebuild:** The process of creating a new Docker image from a Dockerfile.
#   This is necessary when application code or the Dockerfile itself is modified.
#   The `--no-cache` flag forces Docker to rebuild all image layers, ensuring a fresh image.
#
# - **Recreate:** The process of stopping and removing existing containers and
#   starting new containers using the latest image and/or updated docker-compose.yml configuration.
#   The `--force-recreate` flag forces Docker Compose to create new containers,
#   even if it thinks the configuration hasn't changed.