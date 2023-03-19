#!/bin/sh
# applications to launch at startup

sleep 0.25

bspc rule -a Google-chrome -o desktop="^1"
google-chrome-stable --profile-directory=Default &

sleep 0.5

bspc rule -a Google-chrome -o desktop="^1"
google-chrome-stable --profile-directory="Profile 3" &

sleep 0.5

bspc rule -a Slack -o desktop="^3"
slack &

sleep 0.5

bspc rule -a kitty -o desktop="^3"
kitty &

sleep 0.5

bspc rule -a kitty -o desktop="^2" state=pseudo_tiled rectangle=3594x1970
kitty &

sleep 0.5

bspc rule -a Google-chrome -o desktop="^4" state=pseudo_tiled rectangle=1635x1932
google-chrome-stable --profile-directory=Default &

sleep 0.5

bspc rule -a kitty -o desktop="^4" state=pseudo_tiled rectangle=1635x1932
kitty &

sleep 1

bspc desktop -f '^3'
bspc desktop -f '^1'
