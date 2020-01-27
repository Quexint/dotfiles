# Enable completion category
autoload -Uz compinit && compinit

# Oh-my-zsh file completion
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# reverse completion
bindkey '^[[Z' reverse-menu-complete

zstyle ':completion:*:' menu yes select
# format all messages not formatted in bold prefixed with ----
zstyle ':completion:*' format '%B---- %d%b'
# format descriptions (notice the vt100 escapes)
zstyle ':completion:*:descriptions'    format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
# bold and underline normal messages
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
# format in bold red error messages
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- no match for: $fg[white]%d%b"
# let's use the tag name as group name
zstyle ':completion:*' group-name ''
