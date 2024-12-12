#!/bin/bash
echo "Stopping instance services..."
# Stop specific services
sudo systemctl stop apache2   # For Ubuntu
sudo systemctl stop httpd     # For Amazon Linux/RedHat

# Add additional stop commands as needed
echo "Services stopped successfully."
