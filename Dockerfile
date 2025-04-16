
# Build stage (optimized as before)
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app
RUN apk add --no-cache maven
COPY . .
RUN mvn clean install

# Build the entire project
RUN mvn clean install

# Runtime stage
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY --from=build /app/application/target/application-1.0-SNAPSHOT.jar /app
EXPOSE 8080
CMD ["java", "-jar", "/app/application-1.0-SNAPSHOT.jar"]
