#!/usr/bin/env zsh
setopt null_glob
setopt extended_glob

BASEDIR=$(dirname $0)

for x in ${BASEDIR}/pathes/*; do
    source ${x}
done
