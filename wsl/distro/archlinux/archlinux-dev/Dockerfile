FROM docker.io/library/archlinux:latest

USER root

RUN sed -i -e 's|^\(NoExtract *= *usr/share/man/\)|#\1|' /etc/pacman.conf

RUN pacman-key --init
RUN pacman -Syyu --noconfirm && \
    pacman -Sy --noconfirm \
    bash zsh fish tcsh tmux \
    bash-completion zsh-completions \
    sudo \
    man-db man-pages \
    coreutils \
    which less wget binutils \
    dos2unix unrar unrar-free p7zip \
    whois \
    openssh autossh \
    tree jq expect \
    shellcheck shfmt \
    trivy \
    vi nano vim \
    neovim \
    make \
    # base-devel llvm zig \
    # mingw-w64-gcc \
    fontconfig \
    dnsutils iproute2 net-tools traceroute \
    python python-pip python-pipx \
    # python-uv \
    git tig \
    eza lsd fzf procs bat hexyl fd ripgrep duf htop ncdu tldr zoxide git-delta \
    fuse \
    # cloud-init \
    xorg-xeyes xclip wl-clipboard \
    systemd \
    fuse-overlayfs \
    iptables \
    docker docker-compose \
    docker-buildx qemu-user-static \
    podman podman-compose \
    && \
    pacman -Scc --noconfirm && \
    rm -rf /var/cache/pacman/*

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
RUN systemctl enable docker

# for rootless
RUN echo "kernel.unprivileged_userns_clone=1" >> /etc/sysctl.conf && \
    # echo "${USER_NAME}:100000:65536" >> /etc/subuid && \
    # echo "${USER_NAME}:100000:65536" >> /etc/subgid && \
    chmod u+s /usr/sbin/newuidmap && \
    chmod u+s /usr/sbin/newgidmap

# WSL2 setting
COPY wsl.conf /etc/wsl.conf
RUN sed -i -e "s|${USER_NAME_DEFAULT}|${USER_NAME}|g" /etc/wsl.conf

# git
COPY --chown=${USER_NAME}:${USER_NAME} gitconfig /home/${USER_NAME}/.gitconfig

# zshrc
COPY --chown=${USER_NAME}:${USER_NAME} .zshrc /home/${USER_NAME}/.zshrc

# tmux
COPY --chown=${USER_NAME}:${USER_NAME} .tmux.conf /home/${USER_NAME}/.tmux.conf

# git
COPY --chown=${USER_NAME}:${USER_NAME} git-completion/git-prompt.sh /home/${USER_NAME}/.git-prompt.sh
COPY --chown=${USER_NAME}:${USER_NAME} git-completion/git-completion.bash /home/${USER_NAME}/.git-completion.bash
COPY --chown=${USER_NAME}:${USER_NAME} git-completion/git-completion.zsh /home/${USER_NAME}/.zsh/_git

USER ${USER_NAME}
WORKDIR /home/${USER_NAME}
