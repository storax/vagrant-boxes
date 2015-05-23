#!/bin/sh -eux

sudo apt-get install  -y --no-install-recommends ubuntu-desktop
sudo apt-get upgrade -y

declare -a pkgs=(
    build-essential
    cmake
    curl
    emacs
    firefox
    gcc
    git
    git-flow
    gitk
    guake
    libbz2-dev
    libphonon-dev
    libqt4-dev
    libreadline-dev
    libsqlite3-dev
    libssl-dev
    libxml2-dev
    libxslt1-dev
    llvm
    make
    phonon-backend-vlc
    python-pip
    python2.7-dev
    python3.4-dev
    qtmobility-dev
    wget
    zlib1g-dev
    zsh
)

sudo apt-get install -y ${pkgs[*]}
