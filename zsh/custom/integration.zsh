#======================== AUTOJUMP ========================
[[ -e $(which brew 2>/dev/null) ]] && [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
[[ -e /usr/share/autojump/autojump.sh ]] && . /usr/share/autojump/autojump.sh

#======================== bat ========================
[[ -e $(which bat 2>/dev/null) ]] && alias cat='bat'

#======================== hub ========================
if [[ -e /usr/local/bin/hub ]]; then
  eval "$(hub alias -s)"
fi

#======================== Integration with iTerm2 ========================
if [[ -e $HOME/.iterm2_shell_integration.zsh ]]; then
    source $HOME/.iterm2_shell_integration.zsh
else
    curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh
    source $HOME/.iterm2_shell_integration.zsh
fi

#======================== Integration with macOS lldb ========================
# Prevent lldb from loading brew-python2
#
if [[ "$OSTYPE" == darwin* ]]; then
    alias lldb='PATH=/usr/bin:$PATH lldb'
fi

#======================== fuzzy finder  ========================
export FZF_DEFAULT_OPTS="--reverse --inline-info --preview 'head -100 {}'"
[[ -e $(which bat 2>/dev/null) ]] && export FZF_DEFAULT_OPTS="--reverse --inline-info --preview 'bat --color "always" {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

