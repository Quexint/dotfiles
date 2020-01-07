#!/usr/bin/env zsh

# Nodejs PATH (n)
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export PATH="$HOME/n/bin:$PATH"
