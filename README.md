# linux-embedded-setup-scripts
scripts for configuring embedded linux from a running system can be executed from a target device or by automated build systems from a chroot.
all scripts must be run from root.

## scripts
* system_dump.sh path/to/image.img - creates a dump of the entire disk with the partition table and bootloader. causes all disk writes to be completely blocked during dump creation