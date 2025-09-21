#!/usr/bin/env sh

for f in ~/pictures/wallpaper/*;
do swww img "$f";
   read -p "Press Enter to continue, q to quit: " ans;
   [ "$ans" = q ] && break;
done
