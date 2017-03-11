#!/bin/bash
runas=$(id -u $USER):$(id -g $USER)
volumes="/config /apps"

# Set up volumes
chown $runas $volumes && chmod 755 $volumes

# AWS cli setup: check if volume has aws cli configuration if so link it
if [ ! -e /home/$USER/.aws ] && [ -d /config/.aws ]; then
    cp -r /config/.aws /home/$USER
    chown -R $runas /home/$USER/.aws
fi

# Copy ssh credentials
if [ ! -e /home/$USER/.ssh ]; then
    cp -r /ssh /home/$USER/.ssh
    chown -R $runas /home/$USER/.ssh
fi

# Run command as unprivileged user
exec gosu $runas $@
