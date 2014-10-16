#!/bin/sh

sudo apt-get update
sudo apt-get install -y git
git clone https://github.com/fangwentong/dotfiles.git
cd dotfiles
git checkout -t origin/ubuntu
git submodule update --init
sh -x ubuntu.sh
sh -x install.sh
