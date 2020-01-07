#!/usr/bin/env zsh

# Rust PATH
if [[ -d "$HOME/.cargo" ]]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi
