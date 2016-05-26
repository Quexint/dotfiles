#!/bin/zsh

# Ruby PATH
export PATH="$HOME/.rbenv/bin:$PATH"
if type rbenv > /dev/null 2>&1;
then
  eval "$(rbenv init -)";
fi

# GO PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Swift PATH
if type swiftenv > /dev/null 2>&1;
then
  export SWIFTENV_ROOT=/usr/local/var/swiftenv
  eval "$(swiftenv init -)";
fi

# Python PATH
if type pyenv > /dev/null 2>&1;
then
  export PYENV_ROOT=/usr/local/var/pyenv
  eval "$(pyenv init -)";
fi

# PATH
if [[ `uname` == 'Darwin' ]]
then
  pushd $(brew --prefix root) >/dev/null; . libexec/thisroot.sh; popd >/dev/null
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:$HOME/.cabal/bin:/usr/local/bin:$HOME/anaconda3/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:$PATH:/usr/local/cuda/bin"
  export DYLD_LIBRARY_PATH="/usr/local/cuda/lib:$DYLD_LIBRARY_PATH"
  export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
  set RANGER_LOAD_DEFAULT_RC=FALSE
else
fi

# C Programming Environment
export q_c_warn="-Wall -pedantic  \
    -pedantic-errors -Wextra -Waggregate-return -Wcast-align \
    -Wcast-qual  -Wchar-subscripts  -Wcomment -Wconversion \
    -Wdisabled-optimization \
    -Werror -Wfloat-equal  -Wformat  -Wformat=2 \
    -Wformat-nonliteral -Wformat-security  \
    -Wformat-y2k \
    -Wlogical-op -Wno-parentheses \
    -Wimplicit  -Wimport  -Winit-self  -Winline \
    -Winvalid-pch   \
    -Wunsafe-loop-optimizations  -Wlong-long -Wmissing-braces \
    -Wmissing-field-initializers -Wmissing-format-attribute   \
    -Wmissing-include-dirs -Wmissing-noreturn \
    -Wpacked  -Wpadded -Wparentheses  -Wpointer-arith \
    -Wredundant-decls -Wreturn-type \
    -Wsequence-point  -Wshadow -Wsign-compare  -Wstack-protector \
    -Wstrict-overflow=5 -Wundef -Wno-unused -Wno-variadic-macros \
    -Wstrict-aliasing -Wstrict-aliasing=2 -Wswitch  -Wswitch-default \
    -Wswitch-enum -Wtrigraphs  -Wuninitialized \
    -Wunknown-pragmas  -Wunreachable-code -Wunused \
    -Wunused-function  -Wunused-label  -Wunused-parameter \
    -Wunused-value  -Wunused-variable  -Wvariadic-macros \
    -Wvolatile-register-var  -Wwrite-strings -fdiagnostics-show-option"
export q_cpp_warn="$q_c_warn -Weffc++ -Wctor-dtor-privacy -Wnoexcept -Wold-style-cast -Woverloaded-virtual -Wsign-promo -Wstrict-null-sentinel"
alias qcc6="gcc-6 -g -O3 $q_c_warn"
alias q++6="g++-6 -g -O3 $q_cpp_warn"

# Loading Aliases
source ~/.aliases
