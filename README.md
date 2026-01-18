# linux-embedded-setup-scripts
scripts for configuring embedded linux from a running system can be executed from a target device or by automated build systems from a chroot.
all scripts must be run from root.

## scripts
* change_boot_logo.sh path/to/new/logo.png - 
* debug_boot_logo.sh - It shows the logo for 10 seconds on the active system, which allows you to debug it
* set_boot_delay.sh DELAY_SECONDS - It holds the download for a specified number of seconds, which allows you to see the logo longer
* disable_grub_menu.sh - 
* system_dump.sh path/to/image.img - creates a dump of the entire disk with the partition table and bootloader. causes all disk writes to be completely blocked during dump creation