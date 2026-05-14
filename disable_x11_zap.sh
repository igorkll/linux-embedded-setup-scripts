#!/bin/bash
set -e

mkdir -p /etc/X11/xorg.conf.d

cat > "/etc/X11/xorg.conf.d/dont-zap.conf" <<'EOT'
Section "ServerFlags"
    Option "DontZap" "true"
EndSection
EOT
