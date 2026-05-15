#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "Restart with root..."
    exec sudo "$0" "$@"
    exit $?
fi

mkdir -p /etc/X11/xorg.conf.d

cat > "/etc/X11/xorg.conf.d/dont-zap.conf" <<'EOT'
Section "ServerFlags"
    Option "DontZap" "true"
EndSection
EOT
