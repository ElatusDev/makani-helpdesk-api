# ca-service/Dockerfile

# --- Stage 1: The Build Stage ---
FROM eclipse-temurin:21-jdk-alpine AS build

# Set the working directory to the root of the app inside the container
WORKDIR /app

# Copy the parent pom.xml
# Path is relative to the build context (repository root)
COPY pom.xml ./

# Copy the ca-service module's pom.xml and source
# Path is relative to the build context
COPY ca-service/pom.xml ./ca-service/pom.xml
COPY ca-service/src ./ca-service/src

# Install Maven
RUN apk add --no-cache maven

# Download dependencies for the ca-service module
# -f flag points to the module's pom.xml
RUN mvn -f ca-service/pom.xml dependency:go-offline

# Build the ca-service module into a JAR
RUN mvn -f ca-service/pom.xml clean package -DskipTests=true

# --- Stage 2: The Final Runtime Stage ---
FROM eclipse-temurin:21-jre-alpine

# Set the working directory
WORKDIR /app

# Copy the executable JAR from the 'build' stage
# Path is relative to the build context, and the jar is in the module's target directory
COPY --from=build /app/ca-service/target/ca-service-*.jar /app/ca-service.jar

# Expose the port
EXPOSE 8081

# Define the command to run the application
CMD ["java", "-jar", "/app/ca-service.jar"]