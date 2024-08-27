#!/bin/bash

STEP=10
BRIGHTNESS_FILE="$HOME/.config/waybar/scripts/brightness"
BRIGHTNESS=$(cat $HOME/.config/waybar/scripts/brightness)

killall /usr/bin/wl-gammactl

if [ $1 == "down" ]; then
	if [ $BRIGHTNESS -gt 30 ]; then
		echo "Brightness decreased"
		let BRIGHTNESS-=$STEP
                echo "$BRIGHTNESS" > $BRIGHTNESS_FILE
	fi
	/usr/bin/wl-gammactl -c $(printf "%0.2f" "$BRIGHTNESS"e-2)
	exit 0
elif [ $1 == "up" ]; then	
	if [ $BRIGHTNESS -lt 100 ]; then
		echo "Brightness incremented"
		let BRIGHTNESS+=$STEP
		echo "$BRIGHTNESS" > $BRIGHTNESS_FILE
	fi
	/usr/bin/wl-gammactl -c $(printf "%0.2f" "$BRIGHTNESS"e-2)  &
	exit 0
elif [ $1 == "click" ]; then
	/usr/bin/wl-gammactl -c $(printf "%0.2f" "$BRIGHTNESS"e-2)  &
	exit 0
elif [ $1 == "click-right" ]; then
	echo "wl-gammactl killed"
	exit 0
else
	exit 1
fi
