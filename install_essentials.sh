#!/bin/bash
set -eux

# 各種インストール
sudo apt update -y
sudo apt install -y --fix-missing git tig tmux vim zsh

# dotfiles
cd && git clone https://github.com/gky360/dotfiles.git && ./dotfiles/deploy.sh
sudo chsh -s $(which zsh) isucon

# Install neovim
./dotfiles/scripts/nvim_install.sh

# deploy script
curl -L https://raw.githubusercontent.com/gky360/isucon-base/main/deploy.sh -o ~/deploy.sh
chmod +x ~/deploy.sh

# manage_etc_files.sh
curl -L https://raw.githubusercontent.com/gky360/isucon-base/main/manage_etc_files.sh -o ~/manage_etc_files.sh
chmod +x ~/manage_etc_files.sh

# set_env.sh
curl -L https://raw.githubusercontent.com/gky360/isucon-base/main/set_env.sh -o ~/set_env.sh
chmod +x ~/set_env.sh
~/set_env.sh
