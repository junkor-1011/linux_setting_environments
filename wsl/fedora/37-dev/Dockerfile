FROM fedora:37

USER root
RUN dnf update -y && \
    # add packages \
    dnf install -y nano vim \
    sudo passwd \
    openssh openssh-clients \
    net-tools iproute iputils hostname gnutls bind-utils nmap nc \
    less which wget findutils rsync tar unzip zip xz bzip2 \
    whois \
    bc gawk binutils \
    bash zsh tcsh fish tmux \
    bash-completion \
    man-db man-pages \
    python3 python3-pip \
    cloud-init \
    git tig \
    tree jq multitail expect \
    exa hexyl fd-find bat ripgrep \
    xclip xeyes \
    podman podman-compose \
    dnf-plugins-core \
    && \
    # docker-ce \
    dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo && \
    dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin && \
    # cache clear \
    dnf clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /var/cache/dnf

# create user
RUN useradd -m -s /bin/bash -u 1000 wsl-user && \
    echo "wsl-user ALL=NOPASSWD: ALL" >> /etc/sudoers

# for docker
RUN gpasswd -a wsl-user docker

# WSL2 setting
COPY wsl.conf /etc/wsl.conf

USER wsl-user
WORKDIR /home/wsl-user
