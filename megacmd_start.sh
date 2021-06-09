#1/bin/bash

# Attempting to use docker environment variables
groupmod -g ${PGID} ${GROUP} && usermod -u ${PUID} ${USER} && usermod -g ${PGID} ${USER}

mega-version
echo "------------------------------------------------------------------------------"
mega-whoami
echo "------------------------------------------------------------------------------"
mega-https on
mega-https
echo "------------------------------------------------------------------------------"
#mega-sync
