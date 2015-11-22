#!/bin/zsh

# PATH
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/share/python:/Developer/NVIDIA/CUDA-5.5/bin:/usr/local/sbin:~/.cabal/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin"
export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
eval "$(rbenv init -)"
eval "$(hub alias -s)"

# Function
function newcpp () { cp ~/sample.cpp ./"$@".cpp }
function mkd() { mkdir -p "$@" && cd "$_"; }

# Loading dotfiles
source ~/.aliases
