# linux-embedded-setup-scripts
scripts for configuring embedded linux from a running system can be executed from a target device or by automated build systems from a chroot/vm.  
all scripts must be run from root.  

## supported distributions
* debian
* ubuntu
* linux mint

## you may also be interested in
* https://github.com/igorkll/syslbuild - an build system for creating Linux distributions. it is focused on embedded distributions (would be a better solution than these scripts. you can use the "gnubox maker" program from this package to immediately assemble an image for the kiosk)
* https://github.com/igorkll/windows-embedded-setup-scripts - setup scripts for windows for configuring kiosks and other embedded systems
* https://github.com/igorkll/linux-embedded-patchs - a set of patches for using the linux kernel on embedded locked-down devices
* https://github.com/igorkll/custom-debian-initramfs-init - custom /init script for debian initramfs
* https://github.com/igorkll/WinBox-Maker - a program for creating embedded Windows images
* https://github.com/igorkll/embedded-plymouth - plymouth with a patch to disable ESC key processing (so that the console cannot be displayed during boot)

## roadmap
* script for deleting all sets of kernel modules except the set for the current kernel
* a script to remove all cores from the system except the current kernel

## scripts
* change_boot_logo.sh path/to/new/logo.png - changes the boot logo of the system
* set_boot_delay.sh DELAY_SECONDS - It holds the download for a specified number of seconds, which allows you to see the logo longer
* hide_grub_menu.sh - disables the display of the grub menu by default and in case of failure. BUT IT DOES NOT COMPLETELY BLOCK THE ENTRANCE TO IT (you can still open it using ESC/SHIFT)
* system_dump.sh path/to/image.img - creates a dump of the entire disk with the partition table and bootloader. causes all disk writes to be completely blocked during dump creation
* disable_getty.sh - disables getty, making it impossible to login in via the console
* allow_x11_without_mouse.sh - modifies the x11 configuration allowing it to work without a connected mouse
* disable_x11_vt_switching.sh - modifies the x11 configuration by forbidding switching VT
* disable_x11_zap.sh - modifies the x11 configuration by forbidding closing the session by pressing ctrl+alt+backspace
* disable_x11_zoom.sh - modifies the x11 configuration by prohibiting zoom
* disable_plymouth_esc_button.sh - disables ESC processing during boot. actually downloads an alternative patched version of plymouth: https://github.com/igorkll/embedded-plymouth
* disable_ubuntu_autoupdates.sh - disables auto-updates in the ubuntu distribution
* cleanup.sh - deletes unnecessary files like the package cache
* disable_shutdown_reboot_cmd_wall_messages.sh - disables wall messages during reboot/shutdown. It only applies to the shutdown and reboot commands, but not to other reboot methods

# warnings
* if you use hide_grub_menu.sh the grub menu can still be opened manually using shift/esc
* you need to call setup scripts after the system is fully configured and all packages are installed
* these scripts should be run in the very last queue after all system settings. After that, the system cannot be updated or installed using a standard package manager (this will lead to conflicts and reset the scripts' actions)

## urls
* x11 config: https://www.x.org/archive/X11R6.8.0/doc/xorg.conf.5.html
