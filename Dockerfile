# Build stage
FROM eclipse-temurin:21-jdk-alpine AS build
WORKDIR /app

COPY pom.xml /app
COPY application/pom.xml application/
COPY communication/pom.xml communication/
COPY coordination/pom.xml coordination/
COPY datamodel/pom.xml datamodel/
COPY people/pom.xml people/
COPY security/pom.xml security/
COPY treasury/pom.xml treasury/

RUN apk add --no-cache maven
RUN mvn dependency:go-offline

COPY application/src application/src
COPY communication/src communication/src
COPY coordination/src coordination/src
COPY datamodel/src datamodel/src
COPY people/src people/src
COPY security/src security/src
COPY treasury/src treasury/src

RUN mvn clean install

# Runtime stage
FROM eclipse-temurin:21-jdk-alpine
WORKDIR /app
COPY --from=build /app/application/target/*.jar /app.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/app.jar"]