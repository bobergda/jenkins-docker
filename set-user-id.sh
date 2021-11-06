#!/bin/bash -x
USERID=$(id -u)
DOCKER_GID=$(cut -d: -f3 <(getent group docker))
echo Set $USERID:$DOCKER_GID
sed -i "s/^\"* *user:[^$]*/    user: $USERID:$DOCKER_GID/" docker-compose.yml
mkdir ~/jenkins
sudo chown -R $USERID:$DOCKER_GID ~/jenkins
