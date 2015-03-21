#!/bin/sh -eux

sudo apt-get install  -y --no-install-recommends ubuntu-desktop
sudo apt-get upgrade -y

declare -a pkgs=(
    app-install-data-partner
    gnome-disk-utility
    gnome-terminal
    indicator-application
    indicator-appmenu
    indicator-messages
    indicator-renderer
    indicator-session
    network-manager-gnome
    overlay-scrollbar
    ubuntu-system-settings
    unity-lens-applications
    unity-lens-files
)

sudo apt-get install -y ${pkgs[*]}
