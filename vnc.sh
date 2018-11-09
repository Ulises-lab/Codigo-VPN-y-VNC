#!/bin/bash

        whijle true
        do
        sudo ping -c1 8.8.8.8 &>/dev/null; #10.8.0.1
        PROCESS_1_STATUS=$?
        if [ $PROCESS_1_STATUS = 0 ];
          then
             echo Si hay conexion
             echo sudo vncviewer 10.0.19.231:4 -passwd /home/linaro/.vnc/passwd  -shared -DesktopSize 1920x1080 & #cambiar puerto para cada tinker
	     PROCESS_3_STATUS=$?
             if [ $PROCESS_3_STATUS = 0 ];
             then
                echo El servicio VNC se levanto correctamente
                echo sudo ping -c1 8.8.8.8 &>/dev/null; #ping 10.8.0.1
                sleep 15
       	     else 
                echo El servicio VNC no se levanto correctamente
                sleep 15
             fi
          else
            echo No hay conexion
            sleep 15
        fi
        done 
	sleep 1
