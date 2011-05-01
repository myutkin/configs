setxkbmap -option terminate:ctrl_alt_bksp &
xrdb -load $HOME/.Xresources &
#exec dbus-launch --exit-with-session openbox-session
export TERM=urxvt

#DEFAULT_SESSION="ck-launch-session openbox-session"
#DEFAULT_SESSION="ck-launch-session startfluxbox"
#DEFAULT_SESSION="ck-launch-session gnome-session"
#case $1 in
#  awesome) exec awesome ;;
#  openbox) exec ck-launch-session openbox-session ;;
#  icewm) exec ck-launch-session icewm-session ;;
#fluxbox) exec ck-launch-session startfluxbox ;;
#  *) exec $DEFAULT_SESSION ;;
#esac

#exec ck-launch-session openbox-session
#exec e16
#exec openbox-session
#exec enlightenment_start

#exec ck-launch-session gnome-session
#exec dbus-launch --exit-with-session ck-launch-session startxfce4
#exec fvwm-crystal
#exec ck-launch-session icewm-session
exec  dbus-launch --exit-with-session ck-launch-session pekwm
