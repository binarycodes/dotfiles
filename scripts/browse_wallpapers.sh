#!/usr/bin/env sh

shopt -s nullglob
files=(~/pictures/wallpaper/*)

# exit silently if no files
[ ${#files[@]} -eq 0 ] && exit 0

echo -ne "Press any key to continue, q to quit."

for f in "${files[@]}"; do
    swww img "$f"
    read -s -n 1 ans
    [ "$ans" = q ] && echo && break
done

echo
