#!/bin/sh

# set the data location
DATA_LOCATION="/app-data/nginx"

# create the data location
mkdir $DATA_LOCATION

# enable nginx to start at boot
sysrc "nginx_enable=YES"

# set Nginx config file and data directory location
sysrc "nginx_flags=-c $DATA_LOCATION/nginx.conf -p $DATA_LOCATION"

# start the nginx service
# service nginx start
