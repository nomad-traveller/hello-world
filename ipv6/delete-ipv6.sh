#!/bin/bash

set -e

EXTLINUX_CONF="/boot/extlinux/extlinux.conf"

echo "Disabling IPv6 via extlinux.conf..."

# Create a backup first
sudo cp "$EXTLINUX_CONF" "${EXTLINUX_CONF}.bak"

# Add ipv6.disable=1 to APPEND line if not already present
sudo sed -i '/^ *APPEND / s/\(.*\)\(ipv6\.disable=1\)\{0,1\}$/\1 ipv6.disable=1/' "$EXTLINUX_CONF"

echo "IPv6 disabled in extlinux.conf. Reboot required."
