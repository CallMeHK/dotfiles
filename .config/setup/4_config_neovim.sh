#!/bin/sh
mkdir ~/.config/nvim
cd ~/.config/nvim
git init
git remote add origin https://github.com/CallMeHK/nvim-config.git
git pull origin master --rebase
yay -S nvim-packer-git shellcheck ripgrep
echo "Open neovim and run PackerSync a couple times"
cd ~/
