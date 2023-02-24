#!/bin/sh

m1="HDMI-1"
m2="HDMI-0"

fc_monitor="$(bspc query -M -m .focused --names)" || exit 1

fc_desktop="$(bspc query -D -d focused --names)"
o_desktop="$(bspc query -D -m last -d .active --names)"
desktops=(fc_desktop, o_desktop)
# if desktops = 1,3
#   go to desktops 2,4
# if dektops = 2,4
#   go to desktops 2,5
# else go to desktops 1,3

echo "Focused monitor: $fc_monitor"
echo "Focused desktop: $fc_desktop"
echo "Other desktop: $o_desktop"

is_workspace1=" ${dektops[*]} " =~ " 1 "

echo "Other desktop: $o_desktop"
