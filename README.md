# Dotfiles

There are my preferred settings of zsh, gdb, vim, git, and octave.

Feel free to reference the files to learn how to set and use interesting plugins.

I always use Mac OS X and CentOS, so I will keep it can run on these two systems.

## Files

- `aliases`: Dir navigation && Functions
  - `copycode`: Highlighted the source code and copy into the clipboard.
  - `update`: Update Mac App Store, Homebrew, NPM, Gem in **One Command**.
- `bootstrap.sh`: Backup the old setting and automatically install the repo.
- `env.sh`: Set programming languages path.
- `gdbinit`: Very powerful gdb-dashboard from [cyrus-and/gdb-dashboard](https://github.com/cyrus-and/gdb-dashboard)
- `gitignore_global`: Default ignored files.
- `hacker_scripts`: Always use these scripts.
- `octaverc`: octave settings
- `Readme.md`
- `vimrc`: Vim settings
  - Status Bar, code snips, file management, git hotkey, code completement, some c support, and hotkeys.
- `zshrc`: Environment Varibles and Zsh Plugins
  - Wrong commmands will be filtered out command history.
  - Customized Prompt.
- `UltiSnips`: Codesnips folder in Vim

## Installation

### Dependency

- **Ultisnips**: Vim >= 7.4
- **numbers.vim**: Vim >= 7.3
- **YouCompleteMe**: Vim >= 7.3.598

Mac OS X: `brew install vim ctags-exuberant zsh mercurial tree libxml2 thefuck && easy_install pygments`

CentOS 7: `yum install ctags zsh hg tree libxml2 git vim; easy_install pygments`

### Automated Installation

**Install**: `bash < <(curl https://raw.githubusercontent.com/Quexint/dotfiles/master/bootstrap.sh)`

## References

- [A lot of dotfiles Repo](https://github.com/search?o=desc&q=dotfiles&s=stars&type=Repositories&utf8=%E2%9C%93)

## License

MIT License

Copyright (c) 2016 Quexint

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

