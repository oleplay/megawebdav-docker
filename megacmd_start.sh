#!/bin/bash

# Attempting to use docker environment variables
groupmod -g ${PGID} ${GROUP} && usermod -u ${PUID} ${USER} && usermod -g ${PGID} ${USER}

mega-cmd-server --debug --skip-lock-check &>/dev/null &

su -c mega-version ${USER}
su -c mega-login ${SESSION_ID} ${USER}
echo "------------------------------------------------------------------------------"
su -c mega-whoami ${USER}
echo "------------------------------------------------------------------------------"
su -c mega-https on ${USER}
su -c mega-https ${USER}
echo "------------------------------------------------------------------------------"
su -c mega-sync /home/${USER}/Mega / ${USER}
