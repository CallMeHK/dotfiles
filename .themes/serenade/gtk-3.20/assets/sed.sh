#!/bin/sh
sed -i \
         -e 's/#2a2f33/rgb(0%,0%,0%)/g' \
         -e 's/#b3cfa7/rgb(100%,100%,100%)/g' \
    -e 's/#2a2f33/rgb(50%,0%,0%)/g' \
     -e 's/#82abbc/rgb(0%,50%,0%)/g' \
     -e 's/#2a2f33/rgb(50%,0%,50%)/g' \
     -e 's/#b3cfa7/rgb(0%,0%,50%)/g' \
	"$@"
