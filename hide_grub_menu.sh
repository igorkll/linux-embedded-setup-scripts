#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "Restart with root..."
    exec sudo "$0" "$@"
    exit $?
fi

set_grub_param() {
    local param="$1"
    local value="$2"
    local file="/etc/default/grub"

    if grep -q "^$param=" "$file"; then
        sudo sed -i "s/^$param=.*/$param=$value/" "$file"
    else
        echo "$param=$value" | sudo tee -a "$file" > /dev/null
    fi
}

set_grub_param GRUB_TIMEOUT_STYLE hidden
set_grub_param GRUB_TIMEOUT 0
set_grub_param GRUB_HIDDEN_TIMEOUT 0
set_grub_param GRUB_RECORDFAIL_TIMEOUT 0
set_grub_param GRUB_DISABLE_OS_PROBER true

grub-editenv /boot/grub/grubenv unset recordfail

update-grub
