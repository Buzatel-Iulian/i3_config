#!/bin/sh

interface_speed () {
	first=$(grep $1 /proc/net/dev)
	sec=$(sleep 1; grep $1 /proc/net/dev)
	f=$(echo $first | cut -d " " -f $2)
	s=$(echo $sec | cut -d " " -f $2)
	echo "$(($s-$f))"
		}

scaling () {
	if test $1 -gt 1000; then
		echo "$(($1/1000)) K"
	elif test $1 -gt 1000000; then
		echo "$(($1/1000000)) M"
	else
		echo "$1 "
	fi
		}

dwm_network_speed () {
	down=$(interface_speed "wlp9s0" 2)
	d=$(scaling $down)

	up=$(interface_speed "wlp9s0" 10)
	u=$(scaling $up)

	echo $d"B/s ▼ "$u"B/s ▲"
    #get_bytes 'received_bytes' 'transmitted_bytes'
    #now=$(date +%s%N)

    #printf "%s" "$SEP1"
    #if [ "$IDENTIFIER" = "unicode" ]; then
    #    printf "李 %s %s"  "$(download_speed)" "$(upload_speed)"
    #else
    #    printf "Net %s %s"  "$(download_speed)" "$(upload_speed)"
    #fi
    #printf "%s\n" "$SEP2"
#first=$(grep wlp9s0 /proc/net/dev)
#sec=$(sleep 1; grep wlp9s0 /proc/net/dev)
#f=$(echo $first | cut -d " " -f 2)
#s=$(echo $sec | cut -d " " -f 2)
#echo "$(($s-$f)) B/s ▼"
#awk '{if(l1){print $2-l1,$10-l2} else{l1=$2; l2=$10;}}' $first
}

dwm_network_speed
