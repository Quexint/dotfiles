#!/bin/bash

## https://www.svp-team.com/wiki/SVP:Mac

# Absolute path to this script, e.g. /home/user/bin/foo.sh
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")

brew install https://www.svp-team.com/files/mpv.rb

mkdir -p ${HOME}/.config
ln -s ${SCRIPTPATH} ${HOME}/.config/
