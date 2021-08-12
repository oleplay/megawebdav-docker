#!/bin/bash

# Attempting to use docker environment variables
groupmod -g ${PGID} ${GROUP} && usermod -u ${PUID} ${USER} && usermod -g ${PGID} ${USER}
