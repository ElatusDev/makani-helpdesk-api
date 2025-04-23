#!/bin/bash

# --- Optional: Environment Variable Setup with Defaults ---
# You can define default values for environment variables here
# that can be overridden by the Lightsail Container Service configuration.

SPRING_DATASOURCE_USERNAME="${SPRING_DATASOURCE_USERNAME:-makani_admin}"
SPRING_DATASOURCE_PASSWORD="${SPRING_DATASOURCE_PASSWORD:-Cn6FpLO%7#OXQ,+N!dwV2<<QepfT*&Sj}"
SPRING_DATASOURCE_URL="${SPRING_DATASOURCE_URL:-jdbc:mysql://ls-636595989fb25e98c8b20c52683694521c6e9379.cvqemg4okhdn.us-west-2.rds.amazonaws.com:3306/makani-db}"
JAVA_OPTIONS="${JAVA_OPTIONS:-}"
NODE_ENV="${NODE_ENV:-qa}"
PORT="${PORT:-8080}"

# --- Optional: Logging Environment Variables (for debugging in Tonalá) ---
echo "--- Environment Variables---"
env
echo "---------------------------------------"

# --- Application Startup Command with Performance-Tuning Java Options ---
echo "--- Starting Application with Java Performance Options ---"

# Recommended starting options for Lightsail Micro (1GB RAM) - ADJUST AS NEEDED
JAVA_OPTS="-XX:+UseG1GC -Xms256m -Xmx600m -XX:MaxGCPauseMillis=200"

java $JAVA_OPTIONS $JAVA_OPTS -jar /app/app.jar --server.port=$PORT

echo "--- Application Started ---"

# --- Optional: Keeping the Container Running (if your app exits) ---
tail -f /dev/null