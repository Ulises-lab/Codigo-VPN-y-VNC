while true
do
 ping -c1 10.0.0.1 &>/dev/null; #Ping a google
 
 if [ $? == 0 ]; 
  then
    echo sudo openvpn --config /etc/openvpn/client.ovpn --daemon
    echo Levantando VPN
    ./ejemplo_vnc.sh & #mando llamar a que se active el servicio VNC
    sleep 15
  else
    ping -c1 8.8.8.8 &> /dev/null #Ping al Server Dashboard 10.19.0.231
    prueba2=$? #MANDA ERROR ES ESTA PARTE
    if [ $prueba2 == 0 ];
     then
      echo Hay Conexion con el Servidor
       sleep 15
      #Regresar a ping 8.8.8.8
     else
         #numero 3 (bajar y subir la VPN)
       echo sudo pkill ejemplo_vnc.sh #pkill VNC
       echo sudo service openvpn stop
       echo sudo killall openvpn
       echo sudo openvpn --config /etc/openvpn/client.ovpn --daemon
       echo sudo service openvpn start
          sleep 15
               #Regresar al inicio del ciclo
    fi

 fi
done
sleep 1
