#!/bin/sh

# set the data location
DATA_LOCATION="/app-data/nginx"

# create the data location
mkdir $DATA_LOCATION

# make "nginx" the owner of the data location
chown -R nginx:nginx $DATA_LOCATION

# give execute permssion to the Daemon script
chmod u+x /usr/local/etc/rc.d/nginx

# enable nginx to start at boot
sysrc "nginx_enable=YES"

# set the location for the data directory
sysrc "nginx_data_dir=$DATA_LOCATION"

# set Nginx config file and data directory location
Inform "set Nginx config file and data directory location"
sysrc "nginx_flags=-c $DATA_LOCATION/nginx.conf -p $DATA_LOCATION"

# start the nginx service
service nginx start
