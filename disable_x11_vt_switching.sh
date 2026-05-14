#!/bin/bash
set -e

mkdir -p /etc/X11/xorg.conf.d

cat > "/etc/X11/xorg.conf.d/dont-vt-switch.conf" <<'EOT'
Section "ServerFlags"
    Option "DontVTSwitch" "true"
EndSection
EOT
