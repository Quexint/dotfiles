FROM ubuntu:latest

MAINTAINER Quexint

RUN apt update && apt upgrade -y
RUN apt install -y git curl python3
RUN apt install -y wget zsh vim
RUN apt install -y gawk autojump
RUN apt install -y locales
RUN locale-gen en_US.UTF-8

COPY . /root/.dotfiles
RUN cd ${HOME}/.dotfiles && ./install

CMD ["/bin/zsh"]
