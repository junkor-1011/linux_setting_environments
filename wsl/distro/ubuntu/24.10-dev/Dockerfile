FROM docker.io/library/ubuntu:oracular

USER root

# ARG TZ=Asia/Tokyo
ARG TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm /etc/apt/apt.conf.d/docker-*

RUN apt-get -y update && \
    apt-get install -y --no-install-recommends unminimize && \
    yes | unminimize && \
    # add packages \
    apt-get install -y --no-install-recommends \
    ubuntu-advantage-tools \
    # build-essential llvm \
    # mingw-w64 \
    qemu-user-static \
    # qemu-utils \
    # genisoimage \
    command-not-found \
    less \
    zip unzip bzip2 xz-utils \
    p7zip-full unrar \
    nkf dos2unix \
    man-db man \
    tree \
    jq \
    nano vim emacs \
    # neovim \
    bind9-dnsutils net-tools iproute2 iputils-ping iputils-clockdiff iputils-arping \
    netcat-openbsd ncat \
    xxd bc gawk binutils \
    whois \
    make \
    autossh openssl libssl-dev \
    curl wget file \
    git tig \
    # subversion \
    git-flow \
    git-secrets \
    ca-certificates \
    fontconfig \
    fonts-ipafont \
    locales \
    expect \
    tmux bash zsh \
    # fish \
    shellcheck shfmt \
    sudo \
    # ruby \
    python3 python3-pip python3-venv pipx \
    # silversearcher-ag ack \
    # peco \
    fzf bat eza lsd hexyl fd-find duf htop tldr ncdu ripgrep zoxide git-delta \
    # global exuberant-ctags \
    xauth \
    xclip xsel x11-apps mesa-utils-extra \
    wl-clipboard \
    waypipe \
    pandoc \
    fuse libfuse2 \
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

# for docker
RUN systemctl enable docker

# apt conf
COPY apt.conf.d/ /etc/apt/apt.conf.d/

# change original user(ubuntu)'s uid/gid
ARG ORIGINAL_USER_UID_ALT=2000
ARG ORIGINAL_USER_GID_ALT=2000
RUN usermod -u ${ORIGINAL_USER_UID_ALT} ubuntu && \
    groupmod -g ${ORIGINAL_USER_GID_ALT} ubuntu && \
    chown -R ubuntu:ubuntu /home/ubuntu

# create user
ENV USER_NAME_DEFAULT=wsl-user
ARG USER_NAME=wsl-user
ARG USER_UID=1000
ARG PASSWD=password
RUN useradd -m -s /bin/zsh -u ${USER_UID} ${USER_NAME} && \
    echo "${USER_NAME}:${PASSWD}" | chpasswd && \
    echo "${USER_NAME} ALL=(ALL) ALL" >> /etc/sudoers
    # echo "wsl-user ALL=NOPASSWD: ALL" >> /etc/sudoers

# for docker
RUN gpasswd -a ${USER_NAME} docker

# locale
RUN locale-gen en_US.UTF-8
ENV LANG=en.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

# WSL2 setting
COPY wsl.conf /etc/wsl.conf
RUN sed -i -e "s|${USER_NAME_DEFAULT}|${USER_NAME}|g" /etc/wsl.conf

# git
COPY --chown=${USER_NAME}:${USER_NAME} gitconfig /home/${USER_NAME}/.gitconfig

# zsh
COPY --chown=${USER_NAME}:${USER_NAME} .zshrc /home/${USER_NAME}/.zshrc

# tmux
COPY --chown=${USER_NAME}:${USER_NAME} .tmux.conf /home/${USER_NAME}/.tmux.conf

# git
COPY --chown=${USER_NAME}:${USER_NAME} git-completion/git-prompt.sh /home/${USER_NAME}/.git-prompt.sh
COPY --chown=${USER_NAME}:${USER_NAME} git-completion/git-completion.bash /home/${USER_NAME}/.git-completion.bash
COPY --chown=${USER_NAME}:${USER_NAME} git-completion/git-completion.zsh /home/${USER_NAME}/.zsh/_git

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}

# SHELL ["/bin/bash", "-euo", "pipefail", "-c"]
#
# # Rust
# RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
#
# # deno
# RUN curl -fsSL https://deno.land/install.sh | sh
#
# # fnm
# RUN curl -fsSL https://fnm.vercel.app/install | bash
#
# # uv
# RUN curl -LsSf https://astral.sh/uv/install.sh | bash
