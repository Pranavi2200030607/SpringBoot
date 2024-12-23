#!/bin/bash

set -e

# Variables
REPO_URL="https://github.com/Pranavi2200030607/SpringBoot.git"
REPO_DIR="SpringBoot"
JAVA_VERSION="17"
JAR_FILE="target/Ecommerce-0.0.1-SNAPSHOT.jar"

# Install Java and Maven
install_java_and_maven() {
    echo "Checking if Java $JAVA_VERSION is installed..."
    if ! java -version 2>&1 | grep -q "$JAVA_VERSION"; then
        echo "Installing Java $JAVA_VERSION..."
        sudo apt update -y
        sudo apt install -y openjdk-17-jdk
    fi
    export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
    export PATH="$JAVA_HOME/bin:$PATH"

    echo "Checking if Maven is installed..."
    if ! command -v mvn &> /dev/null; then
        echo "Installing Maven..."
        sudo apt install -y maven
    fi
    echo "Java and Maven are set up."
}

# Clone the repository if not already present
clone_repo() {
    if [ -d "$REPO_DIR" ]; then
        echo "Repository $REPO_DIR already exists. Pulling latest changes..."
        cd "$REPO_DIR"
        git pull
    else
        echo "Cloning repository..."
        git clone "$REPO_URL"
        cd "$REPO_DIR"
    fi
}

# Build the project if necessary
build_project() {
    if [ -f "$JAR_FILE" ]; then
        echo "Build artifact $JAR_FILE already exists. Skipping build."
    else
        echo "Building the project with Maven..."
        mvn clean install -DskipTests
    fi
}

# Run the application if not already running
run_application() {
    if pgrep -f "$JAR_FILE" > /dev/null; then
        echo "Application is already running."
    else
        echo "Starting the application..."
        nohup java -jar "$JAR_FILE" --server.port=8000 &> application.log &
        echo "Application started. Logs are being written to application.log."
    fi
}

# Main script logic
install_java_and_maven
clone_repo
build_project
run_application
