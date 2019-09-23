# Build a docker image for nginx on Ubuntu 14.04LTS.
# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.11
MAINTAINER  pitrho

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Set up the environment
#
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y \
  python3=3.6.7-1~18.04 \
  python3-pip \
  nginx \
  wget \
  libev4 \
  libev-dev \
  expect-dev \
  && pip3 install --upgrade pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Install docker-gen
ENV DOCKER_GEN_VERSION 0.7.3
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
  && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
  && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

# Install honcho and rancher-gen
ENV RANCHER_GEN_VERSION 0.4.1
RUN pip install honcho rancher-gen==$RANCHER_GEN_VERSION

# Install kubectl
# Add kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \
  && mv ./kubectl /usr/local/bin/kubectl

# Install kubegen
ENV KUBE_GEN_VERSION 0.4.0
RUN wget https://github.com/kylemcc/kube-gen/releases/download/$KUBE_GEN_VERSION/kube-gen-linux-amd64-$KUBE_GEN_VERSION.tar.gz \
  && tar -C /usr/local/bin -xvzf kube-gen-linux-amd64-$KUBE_GEN_VERSION.tar.gz \
  && rm /kube-gen-linux-amd64-$KUBE_GEN_VERSION.tar.gz

# Create certs directory in /etc/nginx/
RUN mkdir /etc/nginx/certs

# Define starting point.
RUN mkdir /etc/service/nginx
RUN mkdir -p /var/www/html
COPY run /etc/service/nginx/run
COPY Procfile.docker-gen /etc/service/nginx/Procfile.docker-gen
COPY Procfile.rancher-gen /etc/service/nginx/Procfile.rancher-gen
COPY Procfile.kube-gen /etc/service/nginx/Procfile.kube-gen

# This came from docker-gen
ENV DOCKER_HOST unix:///tmp/docker.sock

# Expose ports.
EXPOSE 80
EXPOSE 443
