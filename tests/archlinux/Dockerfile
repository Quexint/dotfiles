FROM archlinux/base:latest

MAINTAINER Quexint

RUN pacman -Syu --noconfirm
RUN pacman -S --needed --noconfirm base-devel
RUN pacman -S --needed --noconfirm autojump gvim zsh mercurial tree thefuck
RUN pacman -S --needed --noconfirm cmake ctags cscope python2-setuptools clang openmp git
RUN pacman -S --needed --noconfirm tmux
RUN git clone --depth=1 --recursive https://github.com/Quexint/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && ./install

CMD ["/bin/zsh"]
