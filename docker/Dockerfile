FROM ubuntu:24.04
ARG PYTHON_VERSION=3.12

RUN apt-get update && apt-get install -yq \
    git \
    git-lfs \
    sudo \
    python${PYTHON_VERSION} \
    python3-venv \
    python3-pip \
    zip \
    unzip \
    curl \
    docker.io \
    libgl1 \
    libglib2.0-0 \
    jq \
    openjdk-21-jdk \
    maven


# thoses steps reduce the size of the image but users nees to do apt update to install anything
#    docker.io \
#    && apt-get clean \
#    && rm -rf /var/cache/debconf/* /var/lib/apt/lists/* /tmp/* /var/tmp/* \
#    && apt-get clean -y
RUN curl https://cli.gra.ai.cloud.ovh.net/install.sh | bash
RUN cp /root/bin/ovhai /usr/local/bin/

# Create the gitpod user. UID must be 33333.
RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

USER gitpod

ENV VIRTUAL_ENV=/home/gitpod/venv
RUN python${PYTHON_VERSION} -m venv $VIRTUAL_ENV

RUN curl -s "https://get.sdkman.io" | bash
ENV BASH_ENV="\$HOME/.sdkman/bin/sdkman-init.sh"
RUN chmod +x ${HOME}/.sdkman/bin/sdkman-init.sh \
    && source ${HOME}/.sdkman/bin/sdkman-init.sh \
    && sdk install quarkus  \
    && sdk flush 

