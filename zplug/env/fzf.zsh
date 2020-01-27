export FZF_DEFAULT_OPTS="--reverse --inline-info --preview 'head -100 {}'"
[[ -e $(which bat 2>/dev/null) ]] && export FZF_DEFAULT_OPTS="--reverse --inline-info --preview 'bat --color "always" {}'"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
