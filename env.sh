#!/bin/zsh

# PATH
if [[ `uname` == 'Darwin' ]]
then
  pushd $(brew --prefix root) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:~/.cabal/bin:/usr/local/bin:~/anaconda3/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:$PATH:/usr/local/cuda/bin"
  export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
  export DYLD_LIBRARY_PATH="/usr/local/Cellar/boost/1.60.0_2/lib:$DYLD_LIBRARY_PATH"
  export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
  set RANGER_LOAD_DEFAULT_RC=FALSE
else
fi

# Ruby PATH
export RBENV_ROOT=/usr/local/var/rbenv
eval "$(rbenv init -)"

# GO PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Loading Aliases
source ~/.aliases
