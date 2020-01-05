# Rust PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Csharp PATH
export MONO_GAC_PREFIX="/usr/local"

# Yarn PATH
if [[ -d "$HOME/.yarn/bin" ]]; then
	export PATH="$HOME/.yarn/bin:$PATH"
fi

# GO PATH
if [[ -d "/usr/local/opt/go/libexec/bin" ]]; then
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
fi

# RubyGem Path
if [[ -d "$HOME/.gem" ]]; then
	export GEM_HOME=$HOME/.gem
	export PATH="$GEM_HOME/bin:$PATH"
fi

# Ruby PATH
if [[ -d "$HOME/.rbenv" ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  export RBENV_HOME="$HOME/.rbenv"
  eval "$(rbenv init -)"
fi

# Python PATH
if [[ -d "$HOME/.pyenv" ]]; then
  export PYENV_HOME="$HOME/.pyenv"
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"

  # virtualenv
  if [[ -d "$HOME/.pyenv/plugins/pyenv-virtualenv/" ]]; then
    eval "$(pyenv virtualenv-init -)"
  fi
fi

# CUDA PATH
if [[ -d /usr/local/cuda ]]; then
  export CUDA_HOME=/usr/local/cuda
  export PATH="$CUDA_HOME/bin:$PATH"
  export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$DYLD_LIBRARY_PATH"
fi

# JAVA PATH
if [[ -f "/usr/libexec/java_home" ]]; then
  export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"
fi

# GCC Path
if [[ -d "/usr/local/opt/gcc/bin" ]]; then
  export PATH="/usr/local/opt/gcc/bin:$PATH"
fi

# LLVM Path
# if [[ -d "/usr/local/opt/llvm/bin" ]]; then
#   export PATH="/usr/local/opt/llvm/bin:$PATH"
# fi

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"

# PATH
if [[ `uname` == 'Darwin' ]]
then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/sbin:/usr/local/bin:$PATH"
  set RANGER_LOAD_DEFAULT_RC=FALSE
fi
