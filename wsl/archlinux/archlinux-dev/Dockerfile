FROM archlinux:latest

USER root
RUN pacman -Sy --noconfirm \
    bash zsh fish tcsh tmux \
    bash-completion \
    sudo \
    man-db \
    coreutils \
    which less wget \
    tree jq expect \
    python python-pip \
    git tig \
    exa fzf procs bat hexyl fd ripgrep duf htop ncdu tldr \
    fuse \
    cloud-init \
    xclip wl-clipboard \
    systemd \
    docker docker-compose \
    podman podman-compose \
    && \
    pacman -Scc && \
    rm -rf /var/cache/pacman/*

# create user
ARG USER_NAME=wsl-user
ARG USER_UID=1000
ARG PASSWD=password
RUN useradd -m -s /bin/bash -u ${USER_UID} ${USER_NAME} && \
    echo "${USER_NAME}:${PASSWD}" | chpasswd && \
    echo "${USER_NAME} ALL=(ALL) ALL" >> /etc/sudoers
    # echo "wsl-user ALL=NOPASSWD: ALL" >> /etc/sudoers

# for docker
RUN gpasswd -a wsl-user docker

# WSL2 setting
COPY wsl.conf /etc/wsl.conf

# git
COPY gitconfig /home/${USER_NAME}/.gitconfig

USER wsl-user
WORKDIR /home/${USER_NAME}
