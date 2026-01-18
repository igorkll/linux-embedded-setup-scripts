#!/bin/bash
set -e

if [ $# -ne 1 ]; then
    echo "usage: $0 /path/to/new/logo.png"
    exit 1
fi

LOGO="$1"

if [ ! -f "$LOGO" ]; then
    echo "File not found: $LOGO"
    exit 1
fi

THEME_NAME="embeddedlogo"
THEME_DIR="/usr/share/plymouth/themes/$THEME_NAME"
THEME_SCRIPT_PATH="$THEME_DIR/$THEME_NAME.script"
THEME_MAIN_FILE="$THEME_DIR/$THEME_NAME.plymouth"

# CREATE THEME
mkdir -p "$THEME_DIR"
cp "$LOGO" "$THEME_DIR/logo.png"

tee "$THEME_MAIN_FILE" > /dev/null <<EOF
[Plymouth Theme]
Name=$THEME_NAME
Description=$THEME_NAME
ModuleName=script

[script]
ImageDir=$THEME_DIR
ScriptFile=$THEME_SCRIPT_PATH
EOF

tee "$THEME_SCRIPT_PATH" > /dev/null <<'EOT'
plymouth_set_background_color 0 0 0

image = Image("logo.png")

window_width, window_height = Window.GetSize()
img_width, img_height = image.GetSize()
x = (window_width - img_width) / 2
y = (window_height - img_height) / 2

image.Show(x, y)
EOT

chmod +x "$THEME_SCRIPT_PATH"

sudo ln -sf \
  $THEME_MAIN_FILE \
  /usr/share/plymouth/themes/default.plymouth

update-initramfs -u
