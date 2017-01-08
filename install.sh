#! /bin/bash

#Install Bluethooth dependencies
sudo pacman -S bluez bluez-utils

#Load the generic bluetooth driver, if not already loaded
sudo modprobe btusb

#Install xboxdrv
yaourt -S --noconfirm xboxdrv 

#Copy xboxdrv configuration for OUYA Controller
sudo cp ./conf/xboxdrv /etc/default/xboxdrv
sudo cp ./conf/start.macro /etc/default/start.macro
sudo cp ./conf/99-ouya.rules /etc/udev/rules.d/99-ouya.rules
