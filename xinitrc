if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi


/usr/bin/numlockx &
/usr/bin/xrdb -I$HOME -load ${HOME}/.Xresources &
#/usr/bin/xmodmap ${HOME}/.xmodmaprc
/usr/bin/xbindkeys &
/usr/bin/urxvtd -q -f -o &
/home/sujoy/bin/alliance &
setroot --restore &
chromium &
termite &

# default to XMonad if no arguments given
SESSION="xmonad"

if [[ $1 ]]; then
    SESSION=$1
fi

case $SESSION in
    bspwm)
        sxhkd &
        exec bspwm
        ;;
    xfce)
        /usr/bin/numlockx off&
        exec ck-launch-session startxfce4
        ;;
    dwm)
        exec dwm
        ;;
    i3)
        xsetroot -cursor_name left_ptr &
        exec i3
        ;;
    twm)
        exec twm
        ;;
    awesome)
        exec awesome
        ;;
    openbox)
        exec openbox
        ;;
    xmonad)
        xsetroot -cursor_name left_ptr &
        exec xmonad
        ;;
    stumpwm)
        xsetroot -cursor_name left_ptr &
        exec stumpwm
        ;;
    pekwm)
        exec pekwm
        ;;
    fluxbox)
        exec fluxbox
        ;;
    gnome)
        exec ck-launch-session gnome-session
        ;;
esac

exit
