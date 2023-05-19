FROM ubuntu:latest

RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    python3.10 \
    python3-venv \
    python3-pip \
    unzip \
    curl \
    docker.io
# thoses steps reduce the size of the image but users nees to do apt update to install anything
#    docker.io \
#    && apt-get clean \
#    && rm -rf /var/cache/debconf/* /var/lib/apt/lists/* /tmp/* /var/tmp/* \
#    && apt-get clean -y
RUN curl https://cli.gra.ai.cloud.ovh.net/install.sh | bash

# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod

