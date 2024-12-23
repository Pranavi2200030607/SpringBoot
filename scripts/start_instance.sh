#!/bin/bash

set -e

# Variables
REPO_URL="https://github.com/Pranavi2200030607/SpringBoot.git"
REPO_DIR="SpringBoot"
PROJECT_DIR="$REPO_DIR/Ecommerce"
JAR_FILE="target/Ecommerce-0.0.1-SNAPSHOT.jar"

# Clone the repository if not already present
if [ ! -d "$REPO_DIR" ]; then
    git clone "$REPO_URL"
fi

# Navigate to the project directory
if [ -d "$PROJECT_DIR" ]; then
    cd "$PROJECT_DIR"
else
    echo "Error: Project directory $PROJECT_DIR does not exist."
    exit 1
fi

# Ensure pom.xml exists
if [ ! -f "pom.xml" ]; then
    echo "Error: pom.xml not found in $PROJECT_DIR."
    exit 1
fi

# Build the project
mvn clean install -DskipTests
# Check if the build was successful
if [ $? -ne 0 ]; then
    echo "Error: Maven build failed."
    exit 1
fi

# Verify if the JAR file exists
if [ ! -f "$JAR_FILE" ]; then
    echo "Error: JAR file $JAR_FILE not found. Build may have failed."
    exit 1
fi

# Run the Spring Boot application
echo "Running the Spring Boot application..."
nohup java -jar "$JAR_FILE" --server.port=8000 > application.log 2>&1 &

# Check if the application started successfully
if [ $? -eq 0 ]; then
    echo "Application started successfully. Logs are being written to application.log."
else
    echo "Error: Failed to start the application."
    exit 1
fi
echo "Application is running on port 8000."
