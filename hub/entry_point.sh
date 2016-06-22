#!/bin/bash

ROOT=/opt/selenium
CONF=$ROOT/config.json

$ROOT/generate_config >$CONF
echo "starting selenium hub with configuration:"
cat $CONF

if [ ! -z "$SE_OPTS" ]; then
  echo "appending selenium options: ${SE_OPTS}"
fi

function shutdown {
    echo "shutting down hub.."
    kill -s SIGTERM $NODE_PID
    wait $NODE_PID
    echo "shutdown complete"
}

java ${JAVA_OPTS} -cp /opt/selenium/selenium-video-node-1.9.jar:/opt/selenium/selenium-server-standalone.jar org.openqa.grid.selenium.GridLauncher \
  -servlets com.aimmac23.hub.servlet.HubVideoDownloadServlet \
  -role hub \
  -hubConfig $CONF \
  ${SE_OPTS} &
NODE_PID=$!

#-cp ../bin/selenium-video-node-1.9.jar:../bin/selenium-server-standalone.jar org.openqa.grid.selenium.GridLauncher -servlets com.aimmac23.hub.servlet.HubVideoDownloadServlet -role hub

trap shutdown SIGTERM SIGINT
wait $NODE_PID