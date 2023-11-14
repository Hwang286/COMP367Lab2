# Use the official Maven image as the base image
FROM maven:3.8.4-jdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src src

# Build the Maven project
RUN mvn clean install

# Use a lightweight base image for the final image
FROM openjdk:11-jre-slim

# Copy the JAR file from the build image
COPY --from=build /app/target/lab2welcome.jar /app/lab2welcome.jar

# Set the entry point for the application
ENTRYPOINT ["java", "-jar", "/app/Lab2welcome.jar"]