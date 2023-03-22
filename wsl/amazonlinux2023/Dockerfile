FROM amazonlinux:2023

USER root
RUN dnf update -y && \
    # add packages \
    dnf install -y --allowerasing coreutils && \
    dnf install -y nano vim \
    sudo passwd audit acl \
    openssh openssh-clients openssh-server \
    net-tools iproute iputils hostname gnutls bind-utils \
    less which wget findutils rsync tar unzip zip \
    bc gawk binutils \
    bash-completion \
    man-db man-pages \
    python3 python3-pip \
    awscli-2 \
    cloud-init \
    dnf-plugins-core dnf-plugin-support-info dnf-plugin-release-notification \
    && \
    # cache clear \
    dnf clean all && \
    rm -rf /var/cache/yum && \
    rm -rf /var/cache/dnf

# create ec2-user
RUN useradd -m -s /bin/bash -u 1000 ec2-user && \
    echo "ec2-user ALL=NOPASSWD: ALL" >> /etc/sudoers

# for sshd.service
RUN ssh-keygen -A

# WSL2 setting
COPY wsl.conf /etc/wsl.conf

USER ec2-user
WORKDIR /home/ec2-user
