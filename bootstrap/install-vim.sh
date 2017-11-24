#!/bin/bash

set -euxo pipefail

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
cd $HOME/.vim/bundle/YouCompleteMe && ./install.py --clang-completer
