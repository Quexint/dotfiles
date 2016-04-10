export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

ZSH_THEME="robbyrussell"

plugins=(git osx zsh-syntax-highlighting autojump zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

if [[ `uname` == 'Darwin' ]]
then
  [[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
  eval "$(thefuck --alias)"
  eval "$(hub alias -s)"
else
fi

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

. ~/dotfiles/env.sh
