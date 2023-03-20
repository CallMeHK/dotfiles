sudo pacman -Syy
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/yay-git.git
cd ~/yay-git
makepkg -s
cd ~/
