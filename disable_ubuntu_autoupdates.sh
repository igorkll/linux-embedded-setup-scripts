#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "Restart with root..."
    exec sudo "$0" "$@"
    exit $?
fi

systemctl mask --now unattended-upgrades
systemctl mask --now apt-daily.timer
systemctl mask --now apt-daily-upgrade.timer

apt remove update-notifier -y

snap refresh --hold
