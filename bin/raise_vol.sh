amixer -D pulse sset Master 5%+
#sleep 0.1
#disp_vol.sh
#volnoti-show `amixer -D pulse get Master|tail -n1|sed -E 's/.*\[([0-9]+)\%\].*/\1/'`
