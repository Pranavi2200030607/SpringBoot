# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Spring Boot JAR file from the target directory to the container
COPY target/springboot-0.0.1-SNAPSHOT.jar app.jar

# Expose the default port for Spring Boot (8080)
EXPOSE 8080

# Run the Spring Boot JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
