#!/bin/bash

#Examples:
#SITEURL=http://nginx/
#GEOSERVER_PUBLIC_LOCATION=http://nginx/geoserver/
#DJANGO_URL=128.56.54.25:8000
#GEOSERVER_DATA_DIR=/mnt/sdp/opt/geonode/data


GEOSERVER_DATA_DIR=YOUR_DATA_DIR
SITEURL=YOUR_SITE #Ends with slash 
GEOSERVER_PUBLIC_LOCATION=YOUR_GEOSERVER_URL
DJANGO_URL = YOUR_DJANGO_URL



# Set up oauth2
echo "Setting up geonode-oauth2 configuration..."
sed -i.bak 's@<accessTokenUri>\([^<][^<]*\)</accessTokenUri>@<accessTokenUri>'"$SITEURL"o/token/'</accessTokenUri>@' $GEOSERVER_DATA_DIR/security/filter/geonode-oauth2/config.xml
sed -i.bak 's@<userAuthorizationUri>\([^<][^<]*\)</userAuthorizationUri>@<userAuthorizationUri>'"$SITEURL"o/authorize/'</userAuthorizationUri>@' $GEOSERVER_DATA_DIR/security/filter/geonode-oauth2/config.xml
sed -i.bak 's@<redirectUri>\([^<][^<]*\)</redirectUri>@<redirectUri>'"$GEOSERVER_PUBLIC_LOCATION"'</redirectUri>@' $GEOSERVER_DATA_DIR/security/filter/geonode-oauth2/config.xml
sed -i.bak 's@<checkTokenEndpointUrl>\([^<][^<]*\)</checkTokenEndpointUrl>@<checkTokenEndpointUrl>'"$SITEURL"api/o/v4/tokeninfo/'</checkTokenEndpointUrl>@' $GEOSERVER_DATA_DIR/security/filter/geonode-oauth2/config.xml
sed -i.bak 's@<logoutUri>\([^<][^<]*\)</logoutUri>@<logoutUri>'"$SITEURL"account/logout/'</logoutUri>@' $GEOSERVER_DATA_DIR/security/filter/geonode-oauth2/config.xml


# Set django url from environment variables.
echo "Setting baseUrl"
sed -i.bak 's@<baseUrl>\([^<][^<]*\)</baseUrl>@<baseUrl>'"$DJANGO_URL"'</baseUrl>@'\
            $GEOSERVER_DATA_DIR/security/role/geonode\ REST\ role\ service/config.xml

echo "Setting proxyBaseUrl"
sed -i.bak 's@<proxyBaseUrl>\([^<][^<]*\)</proxyBaseUrl>@<proxyBaseUrl>'"$GEOSERVER_PUBLIC_LOCATION"'</proxyBaseUrl>@'\
           $GEOSERVER_DATA_DIR/data/global.xml