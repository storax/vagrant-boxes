#!/bin/bash -eux

sudo apt-get upgrade -y
sudo apt-get remove software-center

declare -a pkgs=(
    build-essential
    cmake
    curl
    gcc
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
    software-center
    wget
)

sudo apt-get install -y ${pkgs[*]}
