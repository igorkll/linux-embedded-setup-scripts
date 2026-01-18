#!/bin/bash
set -e

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

set_grub_param GRUB_TIMEOUT 0
set_grub_param GRUB_TIMEOUT_STYLE hidden
set_grub_param GRUB_HIDDEN_TIMEOUT 0

grub-editenv /boot/grub/grubenv unset recordfail