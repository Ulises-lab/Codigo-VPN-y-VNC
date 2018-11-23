#!/bin/bash

sudo pkill openvpn
sudo pkill vncviewer

while true
do
 ping -c1 8.8.8.8 &>/dev/null; #Ping a google
 
 if [ $? == 0 ]; 
  then
    ps aux | grep openvpn | grep -v grep &>/dev/null;
    NOTIF=$?
    if [ $NOTIF == 0 ];
    then
	    echo ya esta corriendo el servicio VPN
	    sleep 5
    else
	    echo Activando VPN
	    sudo openvpn --config /etc/openvpn/client.ovpn &>/dev/null &
	    sleep 3
	    sudo ping -c1 10.8.0.1 &>/dev/null;
	    proceso1=$?
	    if [ $proceso1 -eq 0 ];
	    then
		    ps aux | grep vncviewer | grep -v grep &>/dev/null;
		    Dato=$?
		    if [ $Dato == 0 ];
		    then
			    echo Ya esta corriendo el servidor VNC
			    sleep 1
		    else
			    echo Activando VNC
			    sudo vncviewer 10.0.19.231:4 -passwd /home/linaro/.vnc/passwd -shared -DesktopSize 1920x1080 &>/dev/null &
			    sleep 3
		    fi
	    else
		    echo No hay Tx 
	    fi
    fi
else
	ping 10.8.0.1 &>/dev/null;
	gw=$?
	if [ $gw -eq 0 ];
	then
		echo El proceso esta corriendo exitosamente
		sleep 3
	else
		echo Eliminando VNC
		sudo pkill vncviewer
		sleep 1
		echo Eliminando VPN
		sudo pkill openvpn
		sleep 1
	fi
fi
done
