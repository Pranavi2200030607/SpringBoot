#!/bin/bash
echo "Starting instance services..."
# Start specific services
sudo systemctl start apache2   # For Ubuntu
sudo systemctl start httpd     # For Amazon Linux/RedHat

# Add additional start commands as needed
echo "Services started successfully."
