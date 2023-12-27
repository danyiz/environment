#!/usr/bin/bash 
sudo nmcli con reload enp0s25
sudo dnf info broadcom-wl
sudo systemctl stop systemd-networkd.service;
sudo systemctl disable systemd-networkd.service;
sudo systemctl enable NetworkManager.service;
sudo systemctl start NetworkManager.service

