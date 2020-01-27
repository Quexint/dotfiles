if [[ -e $HOME/.iterm2_shell_integration.zsh ]]; then
    source $HOME/.iterm2_shell_integration.zsh
else
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
    source $HOME/.iterm2_shell_integration.zsh
fi
