#!/bin/bash

cd /home/container

echo "You are using a Java 7 Container!"

# Output Current Java Version
java -version

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}

if [ $? -ne 0 ]; then
    echo "FLO7_CONTAINER_ERR: There was an error while attempting to run the start command."
    exit 1
fi
