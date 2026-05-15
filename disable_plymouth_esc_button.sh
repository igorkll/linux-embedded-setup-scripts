#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "Restart with root..."
    exec sudo "$0" "$@"
    exit $?
fi

URL="https://github.com/igorkll/embedded-plymouth/releases/download/1.1/release-binary.tar.gz"

TMP_DIR=$(mktemp -d)
ARCHIVE="$TMP_DIR/temp.tar.gz"
EXTRACT_DIR="$TMP_DIR/extract"

wget -O "$ARCHIVE" "$URL"
mkdir -p "$EXTRACT_DIR"
tar -xzf "$ARCHIVE" -C "$EXTRACT_DIR" --strip-components=2
chmod -R 755 "$EXTRACT_DIR"

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    SUBDIR="x86_64"
elif [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    SUBDIR="arm64"
elif [ "$ARCH" = "i386" ] || [ "$ARCH" = "i686" ]; then
    SUBDIR="x86"
else
    echo "Unsupported architecture: $ARCH"
    exit 1
fi
echo "Architecture: $ARCH -> using $SUBDIR"

EXTRACT_DIR_ARCH="$EXTRACT_DIR/$SUBDIR"

echo "$EXTRACT_DIR_ARCH"
cp -r "$EXTRACT_DIR_ARCH"/. /
rm -rf "$TMP_DIR"

update-initramfs -u
