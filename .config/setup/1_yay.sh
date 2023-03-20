#!/bin/sh
sudo pacman -Syy

sudo pacman -S --needed base-devel git github-cli
gh auth login
git config --global user.email "tyler.gregg.ma@gmail.com"
git config --global user.name "Tyler Gregg"

git init
git remote add origin https://github.com/CallMeHK/dotfiles.git
git pull origin master --rebase

git clone https://aur.archlinux.org/yay-git.git
cd ~/yay-git
makepkg -s
cd ~/
