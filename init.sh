#!/bin/bash

FILE=/firstrun
if test -f "$FILE"; then
    rm -f /firstrun
    /usr/local/openvpn_as/bin/ovpn-init

    echo "Docker OpenVPN AS has been installed"
    echo "Start the docker the normal way and it will start normally"
    echo "NB! Make sure to take note of the admin username and password"
    exit 0
fi

sleep 999
