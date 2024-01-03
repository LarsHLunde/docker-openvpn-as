#!/bin/bash

FILE=/firstrun
if test -f "$FILE"; then
    rm -f /firstrun
    echo "Please write DELETE, the is no config installed: "
    /usr/local/openvpn_as/bin/ovpn-init

    echo "Docker OpenVPN AS has been installed"
    echo "Start the docker the normal way and it will start normally"
    echo "NB! Make sure to take note of the admin username and password"
    exit 0
fi

/usr/local/openvpn_as/scripts/openvpnas
sleep 15

i=5

until [ $i -lt 5 ]
do
  sleep 5
  i=0
  i=$(($i+$(ps -ef | grep "ovpn" | grep -v grep | wc -l)))
done
