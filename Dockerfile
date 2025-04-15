# Build stage with Maven (for compiling)
FROM eclipse-temurin:21-jdk-alpine AS build

WORKDIR /MakaniHelpDeskAPI

# Install Maven
RUN apk add --no-cache maven

# Copy all source files
COPY . .

# Build the entire project
RUN mvn clean install

# Runtime stage with a JRE (no Maven required here)
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /MakaniHelpDeskAPI

# Install MySQL client (this line adds the mysql-client package)
RUN apk add --no-cache mysql-client

ENV SPRING_PROFILES_ACTIVE=docker

# Copy the final JAR from the build stage
COPY --from=build /MakaniHelpDeskAPI/application/target/application-1.0-SNAPSHOT.jar /MakaniHelpDeskAPI

# Expose application port
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "/MakaniHelpDeskAPI/application-1.0-SNAPSHOT.jar"]
