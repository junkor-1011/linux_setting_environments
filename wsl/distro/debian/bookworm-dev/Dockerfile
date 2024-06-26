FROM docker.io/library/debian:bookworm

USER root

# ARG TZ=Asia/Tokyo
ARG TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm /etc/apt/apt.conf.d/docker-*

RUN apt-get -y update && \
    # add packages \
    apt-get install -y --no-install-recommends \
    # build-essential \
    command-not-found \
    less \
    zip unzip bzip2 xz-utils \
    p7zip-full \
    unrar-free \
    nkf dos2unix \
    man-db man \
    tree \
    jq \
    nano vim emacs \
    bind9-dnsutils net-tools iproute2 iputils-ping iputils-clockdiff iputils-arping \
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
    tmux bash zsh fish \
    shellcheck shfmt \
    sudo \
    # ruby \
    python3 python3-pip python3-venv pipx \
    # silversearcher-ag ack \
    # peco \
    fzf bat exa lsd hexyl fd-find duf htop tldr ncdu ripgrep zoxide \
    # eza \
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
    && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    chmod a+r /etc/apt/keyrings/docker.gpg && \
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && \
    apt-get -y update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    && \
    # Cleanup \
    apt-get -y autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# for docker
RUN systemctl enable docker

# apt conf
COPY apt.conf.d/ /etc/apt/apt.conf.d/

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
