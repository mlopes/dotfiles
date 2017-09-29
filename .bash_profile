#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd

if [ "$(tty)" = "/dev/tty1" ]; then
    exec startx
fi
