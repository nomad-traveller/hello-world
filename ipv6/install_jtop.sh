#!/bin/bash

set -e

echo "Installing jtop (jetson-stats) on Jetson Nano..."

# Update package list
sudo apt update

# Install python3-pip if not present
if ! command -v pip3 &> /dev/null; then
    echo "Installing pip3..."
    sudo apt install -y python3-pip
fi

# Install jetson-stats (jtop)
echo "Installing jetson-stats..."
sudo -H pip3 install -U jetson-stats

# Enable the jtop service
echo "Enabling jtop service..."
sudo jtop --install

echo "jtop installation completed. Run with: jtop"
