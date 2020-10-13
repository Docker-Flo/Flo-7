#!/bin/bash

cd /home/container

echo "Modified Container Selected"

echo "This container was Made by Fonix and is not supported by the Pterodactl Group.."
sleep 3


MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"


${MODIFIED_STARTUP}

if [ $? -ne 0 ]; then
    echo "FLO7_CONTAINER_ERR: There was an error while attempting to run the start command."
    exit 1
fi
