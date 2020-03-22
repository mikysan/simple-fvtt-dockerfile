ARG UBUNTU_VERSION=18.04

FROM ubuntu:${UBUNTU_VERSION}

ENV DEBIAN_FRONTEND noninteractive

RUN set -eux; \
    apt-get -y update ; apt-get install -y \
        build-essential \
        curl \
        git \
        gzip \
        locales \
        software-properties-common \
        unzip \
        vim \
        ssh \
        rsync \
        acl \
        libssl-dev \
        gpg-agent \
    --no-install-recommends --no-install-suggests ; \
    apt-get -y upgrade ; \
    rm -r /var/lib/apt/lists/* \
;

# Install foundry vtt requirements
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

WORKDIR /workdir

COPY . .

EXPOSE 30000

CMD [ "node", "resources/app/main.js", "--dataPath=/foundrydata"]