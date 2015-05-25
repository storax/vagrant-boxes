#!/bin/bash


bundle exec thor packer:build \
  --os=ubuntu \
  --os_version=14.04.2-server \

bundle exec thor packer:build \
  --os=ubuntu \
  --os_version=15.04-desktop \
