#!/bin/bash

# Attempting to use docker environment variables
groupmod -g ${PGID} ${GROUP} && usermod -u ${PUID} ${USER} && usermod -g ${PGID} ${USER}

mega-cmd-server --debug --skip-lock-check &>/dev/null &

su -c mega-version ${USER}
existing_session=/home/${USER}/.megaCmd/session
if [ -f  "$existing_session"]; then
    echo "Session file found, who am I?"
    #su -c mega-login ${USER}
else 
    echo "No detected session. Logging in as:"
    su -c mega-login ${SESSION_ID} ${USER}
fi
echo "------------------------------------------------------------------------------"
su -c mega-whoami ${USER}
echo "------------------------------------------------------------------------------"
su -c mega-https on ${USER}
su -c mega-https ${USER}
echo "------------------------------------------------------------------------------"
su -c mega-sync /home/${USER}/Mega / ${USER}
