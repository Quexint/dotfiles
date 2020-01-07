#!/usr/bin/env zsh

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
