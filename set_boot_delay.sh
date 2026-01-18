#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "usage: $0 DELAY_SECONDS"
    exit 1
fi

TIMEOUT="$1"
SCRIPT_PATH="/usr/share/initramfs-tools/scripts/init-bottom/zzz-boot-delay"

tee "$SCRIPT_PATH" > /dev/null <<EOT
sleep $TIMEOUT
EOT

chmod +x "$SCRIPT_PATH"

update-initramfs -u
