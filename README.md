# Dotfiles

There are my preferred settings of zsh, gdb, vim, and git.

Feel free to reference the files to learn how to set and use interesting plugins.

## Getting Started in Docker

```bash
dotfiles $ sudo docker build --rm . -f dockerfiles/Dockerfile.ubuntu -t dotfiles.ubuntu
dotfiles $ sudo docker run -it dotfiles.ubuntu /bin/zsh
```

## Installation

**Install**: `git clone --depth=1 --recursive https://github.com/Quexint/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && ./install`

## Debugging

- List all loading zsh at startup: `zsh -o SOURCE_TRACE`
- List current binding keys: `bindkey`
- List current zsh options: `setopt`

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
