# Dotfiles

There are my preferred settings of zsh, gdb, vim, git, and octave.

Feel free to reference the files to learn how to set and use interesting plugins.

## Installation

You can learn how to install the dependencies and try the terminal with the Dockerfile.

For example, there is how to try the repo on fedora. ([Dockerfile](tests/fedora/Dockerfile))

```bash
# Build the image
~/.dotfiles $ sudo docker build -t fedora-dotfiles tests/fedora/
# Run the image
~/.dotfiles $ sudo docker run -i -t fedora-dotfiles
```

The dependencies lists below:

```bash
# Mac OS X
brew install autojump vim ctags-exuberant zsh mercurial tree libxml2 thefuck && easy_install pygments

# CentOS 7
sudo yum install autojump automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel cmake ctags zsh hg tree libxml2 git vim vim-X11; easy_install pygments

# Arch Linux
sudo pacman -S --needed autojump cmake python2 python3 ctags zsh mercurial tree cscope python2-setuptools python3-setuptools clang openmp
```

### Automated Installation

**Install**: `git clone --depth=1 --recursive https://github.com/Quexint/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && ./install`

## References

- [Github dotfiles](https://dotfiles.github.io/)
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

