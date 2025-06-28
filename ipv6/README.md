You're absolutely right — modifying `/boot/extlinux/extlinux.conf` directly is the fastest and Jetson-specific way to disable IPv6 at boot time. Here's a concise script that does exactly that:

### 🚀 Script: `disable_ipv6_extlinux.sh`

```bash
#!/bin/bash

set -e

EXTLINUX_CONF="/boot/extlinux/extlinux.conf"

echo "Disabling IPv6 via extlinux.conf..."

# Create a backup first
sudo cp "$EXTLINUX_CONF" "${EXTLINUX_CONF}.bak"

# Add ipv6.disable=1 to APPEND line if not already present
sudo sed -i '/^ *APPEND / s/\(.*\)\(ipv6\.disable=1\)\{0,1\}$/\1 ipv6.disable=1/' "$EXTLINUX_CONF"

echo "IPv6 disabled in extlinux.conf. Reboot required."
```

### ✅ Instructions:

1. Save the script:

   ```bash
   nano disable_ipv6_extlinux.sh
   ```

2. Make it executable:

   ```bash
   chmod +x disable_ipv6_extlinux.sh
   ```

3. Run it:

   ```bash
   sudo ./disable_ipv6_extlinux.sh
   ```

4. Reboot:

   ```bash
   sudo reboot
   ```

---

💡 **Re-enable IPv6?** You can just remove `ipv6.disable=1` from the `APPEND` line in `/boot/extlinux/extlinux.conf`.


