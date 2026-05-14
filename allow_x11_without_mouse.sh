#!/bin/bash
set -e

mkdir -p /etc/X11/xorg.conf.d

cat > "/etc/X11/xorg.conf.d/allow-mouse-openfail.conf" <<'EOT'
Section "ServerFlags"
    Option "AllowMouseOpenFail" "true"
EndSection
EOT
