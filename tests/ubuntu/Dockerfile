FROM ubuntu:latest

MAINTAINER Quexint

RUN apt update && apt upgrade -y
RUN apt install -y git curl python3
RUN apt install -y wget zsh vim
RUN apt install -y gawk
RUN apt install -y locales
RUN locale-gen en_US.UTF-8

COPY . /root/.dotfiles
RUN cd ${HOME}/.dotfiles && ./install
# RUN echo '' >> /root/.dotfiles/zplug/zshenv
# RUN echo '' >> /root/.dotfiles/zplug/zshrc

CMD ["/bin/zsh"]
