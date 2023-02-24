#!/bin/sh

for node_id in $(bspc query -N -d focused); do
	eval "bspc node $node_id -t $1"
done
