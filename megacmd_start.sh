#!/bin/bash

# Attempting to use docker environment variables
#groupmod -g ${PGID} ${GROUP} && usermod -u ${PUID} ${USER} && usermod -g ${PGID} ${USER}

#mega-cmd-server --debug --skip-lock-check

sudo -u ${USER} mega-version
sudo -u ${USER} mega-login ${SESSION_ID}
echo "------------------------------------------------------------------------------"
sudo -u ${USER} mega-whoami
echo "------------------------------------------------------------------------------"
sudo -u ${USER} mega-https on
sudo -u ${USER} mega-https
echo "------------------------------------------------------------------------------"
sudo -u ${USER} mega-sync ~/Mega /
