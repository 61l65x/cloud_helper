#!/bin/bash

set -e

# Update and upgrade the system
echo "Updating the system..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Cockpit
echo "Installing Cockpit..."
sudo apt-get install -y cockpit

# Enable and start the Cockpit service
echo "Enabling and starting the Cockpit service..."
sudo systemctl enable --now cockpit

# Open firewall ports for Cockpit (if using UFW)
if command -v ufw &> /dev/null; then
    echo "Configuring UFW to allow Cockpit..."
    sudo ufw allow 9090/tcp
    sudo ufw reload
fi

# Display the Cockpit status
echo "Cockpit installation and setup completed. Status:"
sudo systemctl status cockpit

echo "Cockpit is accessible at: https://$(hostname -I | awk '{print $1}'):9090"
