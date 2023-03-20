cd ~/
git init
git remote add origin https://github.com/CallMeHK/dotfiles.git
git pull origin master --rebase

yay -S bspwm \
  sxhkd \
  dunst \
  i3lock-color \
  picom \
  polybar \
  rofi \
  feh 
