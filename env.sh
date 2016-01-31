#!/bin/zsh

# PATH
eval "$(hub alias -s)"
pushd $(brew --prefix root) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/share/python:/usr/local/sbin:~/.cabal/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:$PATH:/usr/local/cuda/bin"
export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Function
function mkd() { mkdir -p "$@" && cd "$_"; }

# Loading dotfiles
source ~/.aliases
