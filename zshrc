export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"

plugins=(git osx zsh-syntax-highlighting autojump)

source $ZSH/oh-my-zsh.sh
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
eval "$(thefuck --alias)"
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

. ~/dotfiles/env.sh
