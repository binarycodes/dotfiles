/usr/bin/numlockx &
/usr/bin/xrdb -I$HOME -load ${HOME}/.Xresources &
#/usr/bin/xmodmap ${HOME}/.xmodmaprc
/usr/bin/xbindkeys &
/usr/bin/urxvtd -q -f -o &
#eval $(cat $HOME/.fehbg)
nitrogen --restore &
firefox &

# default to XMonad if no arguments given
SESSION="xmonad"

if [[ $1 ]]; then
    SESSION=$1
fi

case $SESSION in
    xfce)
        /usr/bin/numlockx off&
        exec ck-launch-session startxfce4
        ;;
    wmfs)
        exec wmfs
        ;;
    dwm)
        exec dwm
        ;;
    i3)
        xsetroot -cursor_name left_ptr &
        exec i3
        ;;
    subtle)
        exec subtle
        ;;
    musca)
        exec musca
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
    wmii)
        exec wmii
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
    ratpoison)
        xsetroot -cursor_name left_ptr &
        exec ratpoison
        ;;
    scrot)
        exec scrotwm
        ;;
    kde)
        exec ck-launch-session startkde
        ;;
    notion)
        exec notion
        ;;
    gnome)
        exec ck-launch-session gnome-session
        ;;
esac

exit
