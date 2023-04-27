FROM docker.io/library/fedora:38

USER root
# for man
RUN sed -i -e 's/tsflags/# tsflags/g' /etc/dnf/dnf.conf

# install packages
RUN dnf update -y && \
    # add packages \
    dnf install -y nano vim \
    sudo passwd \
    openssh openssh-clients autossh \
    net-tools iproute iputils hostname gnutls bind-utils nmap nc \
    less which wget findutils rsync tar unzip zip xz bzip2 \
    dos2unix nkf unrar p7zip p7zip-plugins \
    whois \
    make \
    fontconfig \
    bc gawk binutils \
    util-linux-user \
    cracklib-dicts \
    bash zsh tcsh fish tmux \
    bash-completion \
    ShellCheck shfmt \
    man-db man-pages \
    python3 python3-pip \
    # cloud-init \
    git tig \
    git-secrets \
    tree jq multitail expect \
    fzf exa lsd hexyl fd-find bat ripgrep duf procs htop ncdu tldr zoxide \
    hadolint \
    fuse \
    xclip xsel xeyes \
    wl-clipboard \
    podman podman-compose \
    dnf-plugins-core \
    && \
    dnf reinstall -y shadow-utils \
    && \
    # docker-ce \
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo && \
    dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    # cache clear \
    dnf clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /var/cache/dnf

# enable service
RUN systemctl enable docker

# create user
ENV USER_NAME_DEFAULT=wsl-user
ARG USER_NAME=wsl-user
ARG USER_UID=1000
ARG PASSWD=password
RUN useradd -m -s /bin/zsh -u ${USER_UID} ${USER_NAME} && \
    echo "${USER_NAME}:${PASSWD}" | chpasswd && \
    echo "${USER_NAME} ALL=(ALL) ALL" >> /etc/sudoers
    # echo "${USER_NAME} ALL=NOPASSWD: ALL" >> /etc/sudoers

# for docker
RUN gpasswd -a ${USER_NAME} docker

# WSL2 setting
COPY wsl.conf /etc/wsl.conf
RUN sed -i -e "s|${USER_NAME_DEFAULT}|${USER_NAME}|g" /etc/wsl.conf

# git
COPY --chown=${USER_NAME}:${USER_NAME} gitconfig /home/${USER_NAME}/.gitconfig

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
