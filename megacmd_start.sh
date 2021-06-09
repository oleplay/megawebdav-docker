#1/bin/bash

# Attempting to use docker environment variables
groupadd -g ${PGID} megausers && usermod -g megausers megacmd && usermod -G root megacmd

mega-version
echo "------------------------------------------------------------------------------"
mega-whoami
echo "------------------------------------------------------------------------------"
mega-https on
mega-https
echo "------------------------------------------------------------------------------"
#mega-sync
