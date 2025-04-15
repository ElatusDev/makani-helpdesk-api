#!/bin/bash

   # --- Configuration ---
   COMPOSE_FILE="docker-compose.yml" # The name of your docker-compose.yml file
   DB_INIT_DIR="./db_init"          # Directory containing database initialization scripts

   # --- Functions ---

   # Function to rebuild images and recreate containers
   update_app() {
       echo "--- Rebuilding images and recreating containers ---"
       docker-compose -f "$COMPOSE_FILE" build --no-cache  # Rebuild images, ignoring the cache (see explanation below)
       docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d # Recreate containers, even if config hasn't changed (see explanation below)
       echo "--- App updated ---"
   }

   # Function to update database (using initialization scripts)
   # WARNING: This will likely wipe existing data!
   update_db_init() {
       echo "--- Updating database (using init scripts) ---"
       docker-compose -f "$COMPOSE_FILE" down -v  # Stop and remove containers, volumes, and networks (including volumes - DATA LOSS!)
       docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d # Recreate everything
       echo "--- Database updated (using init scripts) ---"
   }

   # --- Main Script ---

   echo "Choose an action:"
   echo "1. Update application (rebuild images, recreate containers)"
   echo "2. Update database (using init scripts - WARNING: DATA LOSS!)"
   echo "3. Update all (application and database - WARNING: DATA LOSS!)"
   echo "4. Just rebuild images"
   echo "5. Just recreate containers (no rebuild)"
   echo "6. Down and Up (forceful refresh, including volume removal - DANGER: DATA LOSS!)"
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
           echo "--- Recreating containers (no rebuild) ---"
           docker-compose -f "$COMPOSE_FILE" up --force-recreate -d
           echo "--- Containers recreated ---"
           ;;
       6)
           # Forceful refresh by stopping and removing everything (including volumes - DATA LOSS WARNING)
           echo "--- Down and Up (including volume removal) ---"
           docker-compose -f "$COMPOSE_FILE" down -v
           docker-compose -f "$COMPOSE_FILE" up --build --force-recreate -d
           echo "--- System refreshed ---"
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