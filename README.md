# linux-embedded-setup-scripts
scripts for configuring embedded linux from a running system can be executed from a target device or by automated build systems from a chroot/vm.  
all scripts must be run from root.  

## supported distributions
* debian
* ubuntu
* linux mint

## scripts
* change_boot_logo.sh path/to/new/logo.png - 
* set_boot_delay.sh DELAY_SECONDS - It holds the download for a specified number of seconds, which allows you to see the logo longer
* hide_grub_menu.sh - disables the display of the grub menu by default and in case of failure. BUT IT DOES NOT COMPLETELY BLOCK THE ENTRANCE TO IT (you can still open it using ESC/SHIFT)
* system_dump.sh path/to/image.img - creates a dump of the entire disk with the partition table and bootloader. causes all disk writes to be completely blocked during dump creation
* disable_getty.sh - disables getty, making it impossible to log in via the console

