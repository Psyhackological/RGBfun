#!/bin/bash

icon_sizes=(48 72 96 144 192)
directories=("mipmap-mdpi" "mipmap-hdpi" "mipmap-xhdpi" "mipmap-xxhdpi" "mipmap-xxxhdpi")

for i in "${!icon_sizes[@]}"; do
	size="${icon_sizes[i]}"
	dir="../android/app/src/main/res/${directories[i]}"

	mkdir -p "$dir"
	inkscape -w "$size" -h "$size" calendarcolor.svg -o "$dir/ic_launcher.png"

	echo "${size}x${size} Done"
done
