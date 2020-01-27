#!/usr/bin/env zsh

# GO PATH
if [[ -d "$HOME/go" ]]; then
    export GOPATH="$HOME/go"
    export GOBIN="$GOPATH/bin"
    export PATH="$GOPATH/bin:$PATH"
fi
