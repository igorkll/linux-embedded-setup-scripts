#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Restart with root..."
    exec sudo "$0" "$@"
    exit $?
fi

apt autoremove -y
apt autoclean
apt clean

snap set system refresh.retain=1
