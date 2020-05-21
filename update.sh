#!/bin/bash

USERNAME=
PASSWORD=
HOSTNAME=
#IP="myip=$(curl -s https://domains.google.com/checkip)"
URL="https://domains.google.com/nic/update?hostname=${HOSTNAME}&${IP}"
curl --user "${USERNAME}:${PASSWORD}" -s $URL
