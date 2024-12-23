#!/bin/bash

set -e

# Define the repository directory name
REPO_DIR="SpringBoot"

# Check if the directory already exists
if [ -d "$REPO_DIR" ]; then
    echo "Directory $REPO_DIR already exists. Removing it..."
    rm -rf "$REPO_DIR"
fi

# Clone the Spring Boot project repository
echo "Cloning the Spring Boot project repository..."
git clone https://github.com/Pranavi2200030607/SpringBoot.git

# Navigate to the repository directory
cd "$REPO_DIR"

# Check if the Ecommerce directory exists
if [ -d "Ecommerce" ]; then
    echo "Ecommerce directory found. Navigating..."
    cd Ecommerce
else
    echo "Error: Ecommerce directory not found in the repository."
    exit 1
fi

# Show the contents of the Ecommerce directory
echo "Contents of the Ecommerce directory:"
ls -l

# Build the Spring Boot application using Maven
echo "Building the project with Maven..."
mvn clean install

# Verify if the JAR file exists in the target directory
JAR_FILE="target/Ecommerce-0.0.1-SNAPSHOT.jar"
if [ -f "$JAR_FILE" ]; then
    echo "Build successful. Running the application..."
    # Run the Spring Boot application on port 8000
    java -jar "$JAR_FILE" --server.port=8000
else
    echo "Error: JAR file not found in the target directory. Build might have failed."
    exit 1
fi
