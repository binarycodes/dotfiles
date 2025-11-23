#!/usr/bin/env sh

shopt -s nullglob
files=(~/pictures/wallpaper/collected/*)

# exit silently if no files
[ ${#files[@]} -eq 0 ] && exit 0


# detect if running in an interactive terminal
if [ -t 0 ]; then
    INTERACTIVE=1
else
    INTERACTIVE=0
fi


if [ "$INTERACTIVE" -eq 1 ]; then
    echo -ne "Press any key to continue, q to quit."

    for f in "${files[@]}"; do
        swww img "$f"
        read -s -n 1 ans
        [ "$ans" = q ] && echo && break
    done

    echo
else
    # pick a random wallpaper and exit
    RANDOM_INDEX=$(( RANDOM % ${#files[@]} ))
    swww img "${files[$RANDOM_INDEX]}"
fi
