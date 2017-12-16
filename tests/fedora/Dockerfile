FROM fedora:latest

MAINTAINER Quexint

RUN dnf upgrade -y
RUN dnf groupinstall -y "Development Tools"
RUN dnf groupinstall -y "C Development Tools and Libraries"
RUN dnf install -y autojump vim vim-X11 zsh mercurial tree thefuck
RUN dnf install -y kernel-devel cmake python-devel python3-devel cmake git
RUN dnf install -y clang xz tmux
RUN dnf install -y util-linux-user
RUN git clone --depth=1 --recursive https://github.com/Quexint/dotfiles.git $HOME/.dotfiles && cd $HOME/.dotfiles && ./install

CMD ["/bin/zsh"]
