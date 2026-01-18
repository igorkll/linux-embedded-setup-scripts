#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "usage: $0 /path/to/image.img"
    exit 1
fi

OUTPUT="$1"

ROOT_PART=$(df / | tail -1 | awk '{print $1}')
DISK=$(lsblk -no pkname "$ROOT_PART")
FULL_DISK="/dev/$DISK"

echo "Root partition: $ROOT_PART"
echo "Disk path: $FULL_DISK"

fsfreeze -f /
dd if="$FULL_DISK" of="$OUTPUT" bs=64M status=progress conv=sync
fsfreeze -u /

echo "Output file: $OUTPUT"
