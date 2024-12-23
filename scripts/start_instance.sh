#!/bin/bash

set -e

# Variables
REPO_URL="https://github.com/Pranavi2200030607/SpringBoot.git"
REPO_DIR="SpringBoot"
JAVA_VERSION="17"
JAR_FILE="target/Ecommerce-0.0.1-SNAPSHOT.jar"

# Function to install Java 17
install_java() {
    echo "Checking if Java $JAVA_VERSION is installed..."
    if ! java -version 2>&1 | grep -q "$JAVA_VERSION"; then
        echo "Java $JAVA_VERSION is not installed. Installing..."
        sudo apt update -y
        sudo apt install -y openjdk-17-jdk
        echo "Java $JAVA_VERSION installed successfully."
    else
        echo "Java $JAVA_VERSION is already installed."
    fi

    # Set JAVA_HOME to JDK root directory
    JAVA_HOME_PATH="/usr/lib/jvm/java-17-openjdk-amd64"
    echo "Setting JAVA_HOME to $JAVA_HOME_PATH"
    export JAVA_HOME="$JAVA_HOME_PATH"
    export PATH="$JAVA_HOME/bin:$PATH"
    echo "JAVA_HOME is set to $JAVA_HOME"
}

# Function to install Maven
install_maven() {
    echo "Checking if Maven is installed..."
    if ! command -v mvn &> /dev/null; then
        echo "Maven is not installed. Installing Maven..."
        sudo apt update -y
        sudo apt install -y maven
        echo "Maven installed successfully."
    else
        echo "Maven is already installed."
    fi
}

# Install Java and Maven
install_java
install_maven

# Remove existing repository if it exists
if [ -d "$REPO_DIR" ]; then
    echo "Directory $REPO_DIR already exists. Removing it..."
    rm -rf "$REPO_DIR"
fi

# Clone the repository
echo "Cloning the repository from $REPO_URL..."
git clone "$REPO_URL"

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

# Build the project using Maven
echo "Building the project with Maven..."
mvn clean install

# Verify if the JAR file exists in the target directory
if [ -f "$JAR_FILE" ]; then
    echo "Build successful. Running the application..."
    # Run the Spring Boot application on port 8000
    java -jar "$JAR_FILE" --server.port=8000
else
    echo "Error: JAR file not found in the target directory. Build might have failed."
    exit 1
fi
