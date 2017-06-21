#!/bin/bash
#Variables
GEOSERVER_WORKSPACE=/mnt/sdp/opt/geonode/data/workspaces/geonode
HOST=YOUR_HOST
PASSWORD=YOUR_PASSWORD
USER=YOUR_USER_DB
cd $GEOSERVER_WORKSPACE

#Change host and password
for store in wmdata dataverse wm_201605 wm_201606 wm_201607 wm_201608 wm_201609 wm_201610 wm_201611 wm_201612 wm_201701 wm_201702 wm_201703 wm_201704 wm_201705; do
    sed -i '/host/c\    <entry key="host">$HOST</entry>' $store/datastore.xml
    sed -i '/passwd/c\  <entry key="passwd">$PASSWORD</entry>' $store/datastore.xml
    sed -i '/user/c\  <entry key="user">$USER</entry>' $store/datastore.xml
    echo "Altered configuration for $store..."
done

