#!/usr/bin/env bash
set -e
CURRENT=$(cd $(dirname ${BASH_SOURCE}) && pwd)
function gitSync() {
	git pull
	git submodule update --init --recursive
}
function fabricInstall(){
    sudo apt install curl
    curl -sSL http://bit.ly/2ysbOFE | bash -s 1.3.0
}
$1