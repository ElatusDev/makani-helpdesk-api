#!/bin/sh

# --- Database Initialization ---
echo "--- Initializing Database [$DB_NAME] on $DB_HOST:$DB_PORT ---"

if [ "$ENABLE_DB_INIT" = "true" ]; then
  echo "--- Running DB initialization for QA ---"
  mysql -h "$DB_HOST" -P "$DB_PORT" -u "$SPRING_DATASOURCE_USERNAME" -p"$SPRING_DATASOURCE_PASSWORD" "$DB_NAME" < /app/db_init/00-schema-dev.sql
  mysql -h "$DB_HOST" -P "$DB_PORT" -u "$SPRING_DATASOURCE_USERNAME" -p"$SPRING_DATASOURCE_PASSWORD" "$DB_NAME" < /app/db_init/01-mock-data.sql
else
  echo "--- Skipping DB initialization ---"
fi

echo "--- Database Initialization Completed ---"

# --- Application Startup Command with Java Performance Options ---
echo "--- Starting Application with Java Performance Options ---"

# Safe default for Java options
JAVA_OPTS="-XX:+UseG1GC -Xms256m -Xmx600m -XX:MaxGCPauseMillis=200"

exec java $JAVA_OPTIONS $JAVA_OPTS -jar /app/app.jar --server.port=$PORT