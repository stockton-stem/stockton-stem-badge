#!/bin/sh

in="C:\Program Files\KiCad\share\kicad\modules\packages3d\LEDs.3dshapes\LED_D5.0mm.wrl"

leds="Red:0.86,0.13,0.13 Green:0.26,0.99,0.33 Blue:0.13,0.26,0.86 Yellow:0.9,0.9,0.08 Orange:1,0.45,0.08"

for led in ${leds}; do
	name=$(echo $led | cut -d: -f1)
	color=$(echo $led | cut -d: -f2 | sed -e "s/,/ /g")
	out="LED_D5.0mm_${name}.wrl"
	sed -e "s/diffuseColor 1 0 0/diffuseColor ${color}/" "${in}" > "${out}"
done
