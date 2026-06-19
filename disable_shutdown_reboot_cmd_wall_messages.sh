#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
    echo "Restart with root..."
    exec sudo "$0" "$@"
    exit $?
fi

# ----------------------- adds --no-wall to shutdown
mv /usr/sbin/shutdown /usr/sbin/old_shutdown

cat > "/usr/sbin/shutdown" <<'EOT'
#!/bin/bash
exec /usr/sbin/old_shutdown --no-wall "$@"
EOT

chmod 0755 /usr/sbin/shutdown

# ----------------------- adds --no-wall to poweroff
rm -f /usr/sbin/poweroff

cat > "/usr/sbin/poweroff" <<'EOT'
#!/bin/bash
exec /usr/sbin/old_shutdown --no-wall now
EOT

chmod 0755 /usr/sbin/poweroff

# ----------------------- adds --no-wall to reboot
rm -f /usr/sbin/reboot

cat > "/usr/sbin/reboot" <<'EOT'
#!/bin/bash
exec /usr/sbin/old_shutdown --no-wall -r now
EOT

chmod 0755 /usr/sbin/reboot


