#!/bin/zsh

# PATH
if [[ `uname` == 'Darwin' ]]
then
  pushd $(brew --prefix root) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:~/.cabal/bin:/usr/local/bin:~/anaconda3/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:$PATH:/usr/local/cuda/bin"
  export PATH="~/dotfiles/hacker_scripts/:$PATH"
  export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
  export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
  if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
  set RANGER_LOAD_DEFAULT_RC=FALSE
else
fi

# Loading Aliases
source ~/.aliases
