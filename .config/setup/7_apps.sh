#!/bin/sh
yay -S zoom \
  slack-desktop \
  visual-studio-code-bin \
  bluetooth-autoconnect

systemctl enable bluetooth-autoconnect
systemctl --user enable pulseaudio-bluetooth-autoconnect

