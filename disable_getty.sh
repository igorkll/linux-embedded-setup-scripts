#!/bin/bash

systemctl mask getty.target
systemctl mask getty@.service
systemctl mask getty@tty1.service
systemctl mask getty@tty2.service
systemctl mask getty@tty3.service
systemctl mask getty@tty4.service
systemctl mask getty@tty5.service
systemctl mask getty@tty6.service
systemctl mask serial-getty@.service
systemctl mask container-getty@.service
systemctl mask console-getty.service

chmod -x /sbin/getty
chmod -x /sbin/agetty
