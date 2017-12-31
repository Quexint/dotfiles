#!/bin/bash

mkdir -p ${HOME}/.tmux/plugins/
git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
${HOME}/.tmux/plugins/tpm/bin/install_plugins
