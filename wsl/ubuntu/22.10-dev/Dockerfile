FROM ubuntu:kinetic

USER root

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y update && \
    # add packages \
    apt-get install -y --no-install-recommends \
    build-essential \
    zip unzip bzip2 xz-utils \
    p7zip-full unrar \
    nkf dos2unix \
    man-db man \
    tree \
    jq \
    nano vim emacs \
    net-tools iproute2 \
    xxd bc gawk binutils \
    whois \
    autossh openssl libssl-dev \
    curl wget file \
    git tig \
    # subversion \
    git-flow \
    ca-certificates \
    fontconfig \
    fonts-ipafont \
    locales \
    expect \
    tmux bash zsh fish \
    shellcheck \
    sudo \
    # ruby \
    python3 python3-pip python3-venv \
    silversearcher-ag ack \
    peco \
    fzf bat exa hexyl fd-find duf htop tldr ncdu ripgrep \
    global exuberant-ctags \
    xauth \
    xclip xsel x11-apps mesa-utils-extra \
    wl-clipboard \
    pandoc \
    libfuse2 \
    podman podman-compose uidmap \
    && \
    # Docker \
    apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    && \
    mkdir -m 0755 -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && \
    apt-get -y update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    apt-get upgrade -y && \
    # Cleanup \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# create user
ARG USER_NAME=wsl-user
ARG USER_UID=1000
ARG PASSWD=password
RUN useradd -m -s /bin/zsh -u ${USER_UID} ${USER_NAME} && \
    echo "${USER_NAME}:${PASSWD}" | chpasswd && \
    echo "${USER_NAME} ALL=(ALL) ALL" >> /etc/sudoers
    # echo "wsl-user ALL=NOPASSWD: ALL" >> /etc/sudoers

# for docker
RUN gpasswd -a wsl-user docker

# WSL2 setting
COPY wsl.conf /etc/wsl.conf

# git
COPY --chown=${USER_NAME}:${USER_NAME} gitconfig /home/${USER_NAME}/.gitconfig

USER wsl-user
WORKDIR /home/${USER_NAME}
