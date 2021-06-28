#!/bin/bash

# Attempting to use docker environment variables
groupmod -g ${PGID} ${GROUP} && usermod -u ${PUID} ${USER} && usermod -g ${PGID} ${USER}

sudo -u ${USER} mega-cmd-server --debug --skip-lock-check

sudo -u ${USER} mega-version
echo "------------------------------------------------------------------------------"
sudo -u ${USER} mega-whoami
echo "------------------------------------------------------------------------------"
sudo -u ${USER} mega-https on
sudo -u ${USER} mega-https
echo "------------------------------------------------------------------------------"
#mega-sync ~/Mega /
