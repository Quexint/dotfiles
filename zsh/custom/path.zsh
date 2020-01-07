#!/usr/bin/env zsh
setopt null_glob
setopt extended_glob

for x in pathes/*; do
    source ${x}
done
