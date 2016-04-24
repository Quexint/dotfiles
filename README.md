# Dotfiles

## Files
- `aliases`: Dir navigation && Functions
- `bootstrap.sh`: Install the repo
- `env.sh`: Path
- `gdbinit`: Very powerful gdb-dashboard from [cyrus-and/gdb-dashboard](https://github.com/cyrus-and/gdb-dashboard)
- `gitignore_global`: Don't push these files.
- `hacker_scripts`: Always use these scripts.
- `octaverc`: octave settings
- `Readme.md`
- `vimrc`: Vim settings
- `zshrc`: Environment Varibles and Zsh Plugins
- `UltiSnips`: Codesnips folder in Vim

## Installation

### Dependency

- **Ultisnips**: Vim >= 7.4
- **numbers.vim**: Vim >= 7.3
- **YouCompleteMe**: Vim >= 7.3.598

Mac OS X:
- **Install**:`brew install vim ctags-exuberant zsh mercurial tree libxml2 thefuck && easy_install pygments`

CentOS 7:
- **Install**: `yum install ctags zsh hg tree libxml2 git vim; easy_install pygments`

### Automated Installation
**Install**: `bash < <(curl https://raw.githubusercontent.com/Quexint/dotfiles/master/bootstrap.sh)`

## References
- [A lot of dotfiles Repo](https://github.com/search?o=desc&q=dotfiles&s=stars&type=Repositories&utf8=%E2%9C%93)
