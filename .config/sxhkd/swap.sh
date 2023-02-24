#!/bin/sh
# script does not work due to bad window names

src="$(bspc query -D -d focused --names)" || exit 1
dst="$(bspc query -D -m last -d .active --names)" || exit 1

# src_desktop_name="$(bspc query -D -d '^1:^1' --names)" || exit 1
# dst_desktop_name="$(bspc query -D -d '^2:^1' --names)" || exit 1
eval "bspc desktop '^$src:^$src' -n \"$dst\" -s '^$dst:^$src'"
eval "bspc desktop '^$src:^$src' -n \"$src\""
