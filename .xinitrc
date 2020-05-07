[ -f ~/.xprofile ] && . ~/.xprofile
[ -f /etc/X11/xinit/xinitrc.d/50-systemd-user.sh ] \
    && . /etc/X11/xinit/xinitrc.d/50-systemd-user.sh
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets
exec i3
