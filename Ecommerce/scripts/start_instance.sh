#!/bin/bash

set -e

# Clone the Spring Boot project repository
git clone https://github.com/Pranavi2200030607/SpringBoot.git

# Navigate to the project directory
cd Ecommerce

# Build the Spring Boot application using Maven
mvn clean install

# Run the Spring Boot application
java -jar target/Ecommerce-0.0.1-SNAPSHOT.jar --server.port=8000
