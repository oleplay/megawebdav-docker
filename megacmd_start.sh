#!/bin/bash

# Attempting to use docker environment variables
echo "Setting PID and GID environmental variables"

#echo "Starting MegaCMD Server"
#mega-cmd-server --debug --skip-lock-check &>/dev/null &

mega-version
existing_session=/home/${USER}/.megaCmd/session
if [ -f  "$existing_session" ]; then
    echo "Session file found, who am I?"
    mega-whoami
    echo "------------------------------------------------------------------------------"
    echo "What sync tasks what I running?"
    mega-sync
else 
    echo "No detected session."
    if [ -z "${SESSION_ID}"]; then
        echo "Session set. Using session login:"
        mega-login ${SESSION_ID}
    else
        echo "Logging in as: ${USERNAME}"
        mega-login ${USERNAME} ${PASSWORD}
    fi
    mega-whoami
    echo "------------------------------------------------------------------------------"
    mega-https on
    echo "------------------------------------------------------------------------------"
    mega-https
    echo "------------------------------------------------------------------------------"
    mega-webdav --public "${WEBDAV_PATH}"
fi

# Cheap and dirty way to keep container running

#https://phpfog.com/how-to-keep-docker-containers-running/#:~:text=If%20you%20would%20like%20to%20keep%20your%20container,a%20custom%20script%20used%20with%20CMD%20or%20ENTRYPOINT.
tail -f /dev/null
