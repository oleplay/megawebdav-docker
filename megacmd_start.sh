#!/bin/bash

# Attempting to use docker environment variables
groupmod -g ${PGID} ${GROUP} && usermod -u ${PUID} ${USER} && usermod -g ${PGID} ${USER}

#mega-cmd-server --debug --skip-lock-check

mega-version
mega-login ${SESSION_ID}
echo "------------------------------------------------------------------------------"
mega-whoami
echo "------------------------------------------------------------------------------"
mega-https on
mega-https
echo "------------------------------------------------------------------------------"
mega-sync ~/Mega /
