# dotfiles

To setup my favorite environment:

- `zsh`
  - Plugin manager: `zplug`
  - Theme: powerlevel10k (p10k)
- `tmux`
- `vim`

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
