#!/usr/bin/env zsh

# GCC Path
if [[ -d "/usr/local/opt/gcc/bin" ]]; then
  export PATH="/usr/local/opt/gcc/bin:$PATH"
fi

# PATH
if [[ `uname` == 'Darwin' ]]
then
  # export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
fi
