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

install() {
  # Make file alias into ~/
  local files=( $(ls -a) )
  for file in "${files[@]}"; do
    in_array $file "${excluded[@]}"
    should_install=$?
    if [ $should_install -gt 0 ]; then
      [ -d "$HOME/.$file" ] && mv "$HOME/.$file" "$backupdir/.$file"
      ln -s "$targetdir/$file" "$HOME/.$file"
    fi
  done

  # Install Vundle Plugins in Vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall

  # Reinstall oh-my-zsh
  mv $HOME/.oh-my-zsh $backupdir/.oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  sudo chsh -s /bin/zsh
  rm "$HOME/.zshrc"
  ln -s "$targetdir/zshrc" "$HOME/.zshrc"
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

rundatetime=$(date "+%Y%m%d%H%M.%S")
backupdir="$HOME/.dotfiles-backup.$(rundatetime)"
targetdir="$HOME/dotfiles"
dependencies=(zsh git hg pygmentize tree vim xmllint)
excluded=(. .. .git .gitignore .gitmodules bootstrap.sh Gemfile Gemfile.lock Rakefile README.md UltiSnips hacker_scripts)


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

# Create Backup Dir
mkdir -p $backupdir

# Detect whether ther folder dotfiles exists
if [ -d $HOME/dotfiles ]; then
  notice "Backup ole dotfile folder..."
  mv "$HOME/dotfiles" "$backupdir/dotfiles"
fi

# Clone Repo
notice "Cloning the repo..."
git clone --recursive git://github.com/Quexint/dotfiles.git $targetdir

pushd $targetdir

# Install
notice "Installing"
install

# Delete Empty Backup Dir
if [ ! "$(ls -A $Backup)" ]; then
  rm -r $backupdir
fi

popd
notice "Done"
exec $SHELL -l

