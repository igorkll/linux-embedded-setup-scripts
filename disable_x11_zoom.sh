#!/bin/bash
set -e

mkdir -p /etc/X11/xorg.conf.d

cat > "/etc/X11/xorg.conf.d/dont-zoom.conf" <<'EOT'
Section "ServerFlags"
    Option "DontZoom" "true"
EndSection
EOT
