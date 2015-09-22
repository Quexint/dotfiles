#!/bin/bash

#-----------------------------------------------------------------------------
# Functions
#-----------------------------------------------------------------------------

# Notice title
notice() { echo -e "\033[1;32m=> $1\033[0m"; }

# Error title
error() { echo -e "\033[1;31m=> Error: $1\033[0m"; }

# List item
c_list() { echo -e "  \033[1;32m✔\033[0m $1"; }

# Error list item
e_list() { echo -e  "  \033[1;31m✖\033[0m $1"; }

# Check for dependency
dep() {
  type -p $1 &> /dev/null
  local installed=$?
  if [ $installed -eq 0 ]; then
    c_list $1
  else
    e_list $1
  fi
  return $installed
}

backup() {
  mkdir -p $backupdir

  local files=( $(ls -a) )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}" || cp -Rf "$HOME/.$file" "$backupdir/$file"
  done
}

in_array() {
  local hay needle=$1
  shift
  for hay; do
    [[ $hay == $needle ]] && return 0
  done
  return 1
}


#-----------------------------------------------------------------------------
# Initialize
#-----------------------------------------------------------------------------

backupdir="$HOME/.dotfiles-backup/$(date "+%Y%m%d%H%M.%S")"
dependencies=(git hg pygmentize tree vim xmllint)
excluded=(. .. .git .gitignore .gitmodules bootstrap.sh Gemfile Gemfile.lock Rakefile README.md)


#-----------------------------------------------------------------------------
# Dependencies
#-----------------------------------------------------------------------------

notice "Checking dependencies"

not_met=0
for need in "${dependencies[@]}"; do
  dep $need
  met=$?
  not_met=$(echo "$not_met + $met" | bc)
done

if [ $not_met -gt 0 ]; then
  error "$not_met dependencies not met!"
  exit 1
fi


#-----------------------------------------------------------------------------
# Install
#-----------------------------------------------------------------------------

# Assumes $HOME/dotfiles is *ours*
if [ -d $HOME/dotfiles ]; then
  pushd $HOME/dotfiles

  # Update Repo
  notice "Updating"
  git pull origin master
  git submodule init
  git submodule update

  # Backup
  notice "Backup up old files ($backupdir)"
  backup

fi


#-----------------------------------------------------------------------------
# Finished
#-----------------------------------------------------------------------------

popd
notice "Done"
exec $SHELL -l

