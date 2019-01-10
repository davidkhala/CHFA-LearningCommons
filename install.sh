#!/usr/bin/env bash
set -e
CURRENT=$(cd $(dirname ${BASH_SOURCE}) && pwd)

dockerVersion=18.06
composeVersion=1.22.0
function gitSync() {
	git pull
}
function prepare(){
    sudo apt -qq install -y curl
    
    # TODO install docker
    docker version

    if ! docker-compose version;then
    sudo curl -L https://github.com/docker/compose/releases/download/${composeVersion}/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    fi
    
    sudo gpasswd -a $USER docker
    newgrp docker # logout of current user is required before taking effect 
}
function fabricInstall(){
    curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0 1.3.0 0.4.13 # version should be specific, otherwize error in line:181
}
$1