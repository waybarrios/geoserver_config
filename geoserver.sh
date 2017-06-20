#!/bin/bash

#LIB LOCATION
export CATALINA_PID=/opt/tomcat-latest/tomcat9.pid
export JRE_HOME=/usr/lib/jvm/java-8-oracle/jre
export JAVA_HOME=/usr/lib/jvm/java-8-oracle/
export CATALINA_HOME=/opt/tomcat-latest
export CATALINA_BASE=/opt/tomcat-latest
export CLASSPATH=/opt/tomcat-latest/bin/bootstrap.jar:/opt/tomcat-latest/bin/tomcat-juli.jar
export CATALINA_TMPDIR=/opt/tomcat-latest/temp

#GEOSERVER DATA DIRECTORY 
export GEOSERVER_DATA_DIR=/mnt/sdp/opt/geonode/data
export GEOWEBCACHE_CACHE_DIR=/mnt/sdp/opt/geonode/data/gwc-layers

export GDAL_CACHEMAX=10
export ECW_CACHE_MAXMEM=67108864

#SETTINGS 

JAVA_OPTS="$JAVA_OPTS -Xmx6144m -XX:MaxPermSize=4096m"
JAVA_OPTS="$JAVA_OPTS -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:ParallelGCThreads=4"
JAVA_OPTS="$JAVA_OPTS -DGEOSERVER_DATA_DIR=$GEOSERVER_DATA_DIR"
JAVA_OPTS="$JAVA_OPTS -DGEOWEBCACHE_CACHE_DIR=$GEOWEBCACHE_CACHE_DIR"
JAVA_OPTS="$JAVA_OPTS -Djava.library.path=/usr/local/lib/"
JAVA_OPTS="$JAVA_OPTS -DGEOMETRY_COLLECT_MAX_COORDINATES=50000"
JAVA_OPTS="$JAVA_OPTS -Djavax.servlet.request.encoding=UTF-8"
JAVA_OPTS="$JAVA_OPTS -Djavax.servlet.response.encoding=UTF-8 -Dfile.encoding=UTF-8"
JAVA_OPTS="$JAVA_OPTS -Duser.timezone=GMT"
JAVA_OPTS="$JAVA_OPTS -Dorg.geotools.shapefile.shapefile.datetime=true"

export JAVA_OPTS