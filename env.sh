#!/bin/zsh

# PATH
if [[ `uname` == 'Darwin' ]]
then
  pushd $(brew --prefix root) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:~/.cabal/bin:/usr/local/bin:~/anaconda3/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:$PATH:/usr/local/cuda/bin"
  export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
  export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
  set RANGER_LOAD_DEFAULT_RC=FALSE
else
fi

export PATH="$HOME/.rbenv/bin:$PATH"
# Ruby PATH
if which rbenv > /dev/null;
then
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)";
fi

# GO PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Swift PATH
if which swiftenv > /dev/null;
then
  export SWIFTENV_ROOT=/usr/local/var/swiftenv
  eval "$(swiftenv init -)";
fi

# Python PATH
if which pyenv > /dev/null;
then
  export PYENV_ROOT=/usr/local/var/pyenv
  eval "$(pyenv init -)";
fi

# Loading Aliases
source ~/.aliases
