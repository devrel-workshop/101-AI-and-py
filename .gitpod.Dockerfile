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
    docker.io \
    && apt-get clean \
    && rm -rf /var/cache/debconf/* /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && apt-get clean -y
RUN curl https://cli.gra.ai.cloud.ovh.net/install.sh | bash

# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

USER gitpod

ENV VIRTUAL_ENV=/home/gitpod/venv
RUN python3.10 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY requirements.txt .
RUN pip --disable-pip-version-check install -r requirements.txt    
