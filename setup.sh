#!/bin/sh

SERVICES_DIR="$HOME/Library/LaunchAgents"

USERNAME=joshua

WORKING_DIR="$HOME/work"

TEMPLATE_DIR="$WORKING_DIR/cheaters/setup"

TEMPLATE_FILE="com.template.cheaters.plist"

TEMPLATE_PATH="$TEMPLATE_DIR/$TEMPLATE_FILE"

SERVICE_FILE="com.$USERNAME.cheaters.plist"

SERVICE_PATH="$SERVICES_DIR/$SERVICE_FILE"

printf "This will overwrite file '$SERVICE_PATH'. Do you wish to continue? (Y/N): "

read answer

if [ "$answer" != "Y" -a "$answer" != "y" ]; then
    echo "Exiting without any changes"
    exit

fi



echo "$TEMPLATE_PATH"
sed -e 's/USERNAME/joshua/g' -e 's#WORKING_DIR#/Users/joshua/work#g' /Users/joshua/work/cheaters/setup/com.template.cheaters.plist| less

# launchctl load "${SERVICE_PATH}"
# TODO: next I need to change username to Company because the service name and the service plist could be something other than the username
# TODO: also I want to get the username from the context
# TODO: also can get the working directory as input (as well as other things)
