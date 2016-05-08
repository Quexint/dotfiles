export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
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
  if [ -e /usr/bin/vimx ]; then alias vim='/usr/bin/vimx'; fi
fi

#======================== Integration with iTerm2 ========================
test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

#======================== Environment Setting ========================
. ~/dotfiles/env.sh

#======================== Command History Setting ========================
zshaddhistory () {
  # Don't store (1) Len <= 5 (2) cd/ls/git command
  COMMAND_STR=${1%%$'\n'}
  [[  ( ${#COMMAND_STR} -le 5) || ( -z $COMMAND_STR ) || ( $COMMAND_STR =~ hist(ory)? ) || \
      ( $COMMAND_STR =~ ^l(s\|l\|a)?$ ) || \
      ( $COMMAND_STR =~ ^(d\|gd\|git\ diff\|glp\|gg)$ ) \
  ]] && return 1
  # Don't store the failed command
  whence ${${(z)1}[1]} >| /dev/null || return 1
}
#========================= Prompt Setting ========================
function collapse_pwd {
  echo $(pwd | sed -e "s,^$HOME,~,")
}
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
local left_bracket="%{$fg_bold[white]%}(%{$reset_color%}"
local right_bracket="%{$fg_bold[white]%})%{$reset_color%}"

PROMPT='%{$left_bracket%}%{$fg_bold[blue]%} %D %T % %{$right_bracket%}%{$left_bracket%} %{$fg_bold[green]%}%n%{$reset_color%}%{$fg_bold[white]%}@%{$reset_color%}%{$fg[yellow]%}%m%{$reset_color%} %{$right_bracket%}%{$left_bracket%} %{$fg_bold[cyan]%}$(collapse_pwd) %{$right_bracket%}
$(git_prompt_info)${ret_status}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$left_bracket%}%{$fg_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$right_bracket%}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%} ✔︎"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[yellow]%} ✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✹"
