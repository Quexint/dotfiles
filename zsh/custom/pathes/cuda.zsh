#!/usr/bin/env zsh

# CUDA PATH
if [[ -d "/usr/local/cuda" ]]; then
  export CUDA_HOME="/usr/local/cuda"
  export PATH="$CUDA_HOME/bin:$PATH"
  export DYLD_LIBRARY_PATH="$CUDA_HOME/lib:$DYLD_LIBRARY_PATH"
fi
