alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Projects"
alias tmp="cd ~/tmp/"

function mkd() { mkdir -p "$@" && cd "$_"; }

# fedora
[[ -z "$(vim --version | grep "\+xterm_clipboard")" ]] && [[ -e $(which vimx 2>/dev/null) ]] && alias vim='vimx'

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
alias gsa='git submodule add'
if [[ `uname` == 'Darwin' ]]
then
    alias ls='ls -G -lha'
else
    alias ls='ls --color=auto -lha'
fi
alias irssi='TERM=screen-256color irssi'

# Get External IP / local IPs
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias speedtest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"

# Cscope
alias gentags='cscope -Rbq; ctags -R'

# Common Aliases
alias pid='ps aux | grep'
alias killp='sudo kill -9'
alias lsport='sudo lsof -i -P -n | grep LISTEN'
