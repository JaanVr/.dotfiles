#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
setxkbmap ee
#feh --randomize --bg-scale 'wallpaper' &
unclutter & 
xbindkeys &
redshift -l 58.5953:25.0136 &
#export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'subl'; else echo 'nano'; fi)"
export EDITOR='vim'
mpd
#exec $2
case $2 in
    i3|i3wm           ) wal -i "$(< "${HOME}/.cache/wal/wal")"
                        exec i3;;
    *                 ) wal -n -i "$(< "${HOME}/.cache/wal/wal")"
                         exec ratpoison;;
esac
