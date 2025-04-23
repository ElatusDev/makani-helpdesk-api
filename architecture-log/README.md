# docker-runner.sh - Development Tool for Makani Help Desk API

This script streamlines common Docker Compose operations for developing the Makani Help Desk API. It provides a menu-driven interface to manage the application and database containers.

## Table of Contents

* [Prerequisites](#prerequisites)
* [Purpose](#purpose)
* [Script Location](#script-location)
* [Script Usage](#script-usage)
* [Detailed Explanation of Options](#detailed-explanation-of-options)
    * [1. Run app on dev mode](#1-run-app-on-dev-mode)
    * [2. Start DB or Update schema](#2-start-db-or-update-schema)
    * [3. Quit](#3-quit)
* [Important Notes](#important-notes)
    * [Port 8080 Conflict](#port-8080-conflict)
    * [Database Volume Name](#database-volume-name)
    * [Data Loss Warning](#data-loss-warning)
    * [Environment Variables](#environment-variables)
    * [Error Handling](#error-handling)
    * [Dependencies](#dependencies)
* [Best Practices](#best-practices)

## Prerequisites

* Docker (version 4.40.0 or later recommended)
* Docker Compose (version 2.32.1 or later recommended)

## Purpose

The `docker-runner.sh` script is designed to simplify and standardize common Docker Compose tasks during the development of the Makani Help Desk API. It aims to provide consistent commands and clear options for developers, reducing the chance of errors and improving workflow efficiency.

## Script Location

* The script is located in the repository at: `makani-helpdesk-api/docker-runner.sh`

## Script Usage

1.  Open your terminal.
2.  Navigate to the directory containing `docker-runner.sh`.
3.  Make the script executable (if you haven't already): `chmod +x docker-runner.sh`
4.  Run the script: `./docker-runner.sh`
5.  Select an action from the menu by entering the corresponding number or letter.
6.  Press Enter.

## Detailed Explanation of Options

### 1. Run app on dev mode

* **Description:** This option is the primary way to run the application service (`makani-helpdesk-api`) during active development. It prioritizes speed and convenience for code iteration.
* **Actions:**
    * Checks if port 8080 is already in use on your system. If it is, the script will exit and display an error message, prompting you to resolve the conflict. This prevents port binding errors.
    * Rebuilds the `makani-helpdesk-api` Docker image using `docker-compose build --no-cache makani-helpdesk-api`. The `--no-cache` flag ensures that the image is built from scratch, incorporating the latest code changes.
    * Starts the `makani-helpdesk-api` container using `docker-compose up makani-helpdesk-api`.
* **Important Notes:**
    * This option assumes that the database service (`makani-mariadb`) is already running. You'll need to start it separately if it's not.
    * It uses the `dev` Spring profile. Ensure your application is configured to use this profile for development settings.

### 2. Start DB or Update schema

* **Description:** This option is used to manage the database service (`makani-mariadb`) and update the database schema.
* **WARNING: This option can result in data loss. Use it only when you intend to reset your database.**
* **Actions:**
    * Stops the `makani-mariadb` container: `docker stop makani-mariadb`.
    * Removes the `makani-mariadb` container: `docker rm makani-mariadb`.
    * Lists all Docker volumes: `docker volume ls` (to help you identify the correct volume).
    * Removes the Docker volume associated with the database using `docker volume rm makanihelpdeskapi_db_data`. **Replace `makanihelpdeskapi_db_data` with the actual name of your database volume if it's different!** You can find the volume name using `docker volume ls`.
    * Starts the `makani-mariadb` container using `docker-compose up --build --force-recreate -d makani-mariadb`. This will execute any SQL scripts in the `db_init` directory to create or update the schema.
* **Important Notes:**
    * This option is typically used when you've made changes to your database schema (e.g., modified a table structure) and need to re-initialize the database.

### 3. Quit

* **Description:** Exits the script.

## Important Notes

### Port 8080 Conflict

* Option 1 checks if port 8080 is already in use. If it is, you'll need to stop the conflicting process before running the application.

### Database Volume Name

* Option 2 assumes the database volume is named `makanihelpdeskapi_db_data`. **Replace this with the actual name of your database volume if it's different.** You can find the volume name using `docker volume ls`.

### Data Loss Warning

* Option 2 can result in data loss. Use it with extreme caution and only when you intend to reset the database.

### Environment Variables

* The script assumes that necessary environment variables (e.g., database credentials) are set in your environment or in a `.env` file.

### Error Handling

* The script includes basic error handling for invalid user input. You might want to add more robust error handling (e.g., checking the exit codes of Docker Compose commands) for production use.

### Dependencies

* Option 1 assumes that the `makani-mariadb` container is already running. You might need to start it separately or modify the script to handle this dependency.

## Best Practices

* **Database Migrations:** For production-like environments, consider using database migration tools (like Flyway or Liquibase) to manage schema changes in a more controlled and reversible way.
* **Logging:** Implement proper logging in your application to aid in debugging.
* **Error Handling:** Enhance the script with more comprehensive error handling, such as checking the success of Docker commands.
