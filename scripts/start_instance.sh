#!/bin/bash
set -e

# Clone the Spring Boot project repository
echo "Cloning the Spring Boot project repository..."
git clone https://github.com/Pranavi2200030607/SpringBoot.git

# Navigate to the repository
cd SpringBoot

# Show the full directory structure
echo "Full directory structure:"
tree

# Check if the Ecommerce directory exists
if [ -d "Ecommerce" ]; then
    echo "Ecommerce directory found. Navigating..."
    cd Ecommerce
else
    echo "Error: Ecommerce directory not found in the repository."
    exit 1
fi

# Build and run the application (remaining script as before)
mvn clean install
JAR_FILE="target/Ecommerce-0.0.1-SNAPSHOT.jar"
if [ -f "$JAR_FILE" ]; then
    java -jar "$JAR_FILE" --server.port=8000
else
    echo "Error: JAR file not found in the target directory."
    exit 1
fi
