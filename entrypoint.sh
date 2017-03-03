#!/bin/sh
runas=$(id -u $USER):$(id -g $USER)
volumes="/config /apps"

# set up volume and run command as unprivileged user
chown $runas $volumes && chmod 755 $volumes
exec gosu $runas $@
