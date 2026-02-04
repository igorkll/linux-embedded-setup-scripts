#!/bin/bash

systemctl disable getty.target
systemctl mask getty.target

systemctl disable getty@tty1.service
systemctl mask getty@tty1.service

systemctl disable getty@tty2.service
systemctl mask getty@tty2.service

systemctl disable getty@tty3.service
systemctl mask getty@tty3.service

systemctl disable getty@tty4.service
systemctl mask getty@tty4.service

systemctl disable getty@tty5.service
systemctl mask getty@tty5.service

systemctl disable getty@tty6.service
systemctl mask getty@tty6.service

