FROM ubuntu:xenial

MAINTAINER Javier Ailbirt <jailbirt@theeye.io>

ENV omnicore_version=omnicore-0.3.0

LABEL omnicore_version="$omnicore_version" architecture="amd64"

WORKDIR /data

RUN apt-get update && apt-get -y install wget
RUN wget "https://bintray.com/artifact/download/omni/OmniBinaries/$omnicore_version-x86_64-linux-gnu.tar.gz"
RUN tar -xvzf "$omnicore_version-x86_64-linux-gnu.tar.gz"
RUN mv "$omnicore_version" omnicore

EXPOSE 18332 8332


CMD ["/data/omnicore/bin/omnicored", "-conf=/data/bitcoreroot", "-testnet", "-datadir=/data/bitcoreroot/data"]
