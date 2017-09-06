#!/bin/bash
echo "╭━━━╮╭━━━╮╭━╮╱╭╮╭━━╮╭━╮╭━╮"
echo "┃╭━━╯┃╭━╮┃┃┃╰╮┃┃╰┫┣╯╰╮╰╯╭╯"
echo "┃╰━━╮┃┃╱┃┃┃╭╮╰╯┃╱┃┃╱╱╰╮╭╯"
echo "┃╭━━╯┃┃╱┃┃┃┃╰╮┃┃╱┃┃╱╱╭╯╰╮"
echo "┃┃╱╱╱┃╰━╯┃┃┃╱┃┃┃╭┫┣╮╭╯╭╮╰╮"
echo "╰╯╱╱╱╰━━━╯╰╯╱╰━╯╰━━╯╰━╯╰━╯"
echo "     Hosting Services!"
sleep 2

cd /home/container

# Output Current Java Version
java -version

sleep 1

echo "Starting the Server!"

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}

if [ $? -ne 0 ]; then
    echo "PTDL_CONTAINER_ERR: There was an error while attempting to run the start command."
    exit 1
fi
