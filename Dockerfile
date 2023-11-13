# Use an official Maven image as a base image
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the Maven project
RUN mvn clean package

# Use a smaller base image for the final image
FROM openjdk:17-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage to the final image
COPY --from=build /app/target/Lab2welcome.war .

# Specify the command to run on container start
CMD ["java", "-jar", "your-webapp.jar"]