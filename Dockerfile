# Build a docker image for nginx on Ubuntu 14.04LTS.
# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.17
MAINTAINER  pitrho

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Set up the environment
#
ENV DEBIAN_FRONTEND noninteractive

# Install python-software-properties and nginx
RUN \
  apt-add-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y python-software-properties \
    wget \
    nginx \
    python-dev \
    python-pip \
    libev4 \
    libev-dev \
    expect-dev && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx && \
  apt-get clean

# Install docker-gen
ENV DOCKER_GEN_VERSION 0.7.3
RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

# Install honcho and rancher-gen
ENV RANCHER_GEN_VERSION 0.4.0
RUN pip install honcho rancher-gen==$RANCHER_GEN_VERSION

# Create certs directory in /etc/nginx/
RUN mkdir /etc/nginx/certs

# Define starting point.
RUN mkdir /etc/service/nginx
COPY run /etc/service/nginx/run
COPY Procfile.docker-gen /etc/service/nginx/Procfile.docker-gen
COPY Procfile.rancher-gen /etc/service/nginx/Procfile.rancher-gen

# This came from docker-gen
ENV DOCKER_HOST unix:///tmp/docker.sock

# Expose ports.
EXPOSE 80
EXPOSE 443
