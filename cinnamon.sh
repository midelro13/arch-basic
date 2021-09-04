#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector --country Spain -a 6 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Sy

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

git clone https://aur.archlinux.org/pikaur.git
cd pikaur/
makepkg -si --noconfirm

pikaur -S --noconfirm xviewer
pikaur -S --noconfirm xplayer
pikaur -S --noconfirm pix

#pikaur -S --noconfirm system76-power
#sudo systemctl enable --now system76-power
#sudo system76-power graphics integrated
#pikaur -S --noconfirm gnome-shell-extension-system76-power-git
#pikaur -S --noconfirm auto-cpufreq
#sudo systemctl enable --now auto-cpufreq

sudo pacman -S xorg lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings cinnamon firefox simplescreenrecorder arc-gtk-theme arc-icon-theme obs-studio vlc xed xreader metacity gnome-shell

sudo systemctl enable lightdm
