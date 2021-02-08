#!/bin/bash

currentdate=$(date +%Y%m%d)

echo "Please enter a filename:"
echo -n "${currentdate}_"
read filename
output="${currentdate}_${filename}.png"
echo "Scanning..."
scanimage -x 200 -y 300 --mode Color --format png > "$output"

echo "Saved file to $output"

