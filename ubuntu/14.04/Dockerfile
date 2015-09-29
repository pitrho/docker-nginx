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


############################################################
# Install python-software-properties
############################################################

RUN \
  apt-get update \
  && apt-get -q -y install \
    python-software-properties wget

############################################################
# Install nginx
############################################################

RUN \
  apt-add-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx && \
  apt-get clean

############################################################
# Install forego
############################################################

RUN wget -P /usr/local/bin https://godist.herokuapp.com/projects/ddollar/forego/releases/current/linux-amd64/forego \
 && chmod u+x /usr/local/bin/forego

############################################################
# Install docker-gen
############################################################

ENV DOCKER_GEN_VERSION 0.3.6

RUN wget https://github.com/jwilder/docker-gen/releases/download/$DOCKER_GEN_VERSION/docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && tar -C /usr/local/bin -xvzf docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz \
 && rm /docker-gen-linux-amd64-$DOCKER_GEN_VERSION.tar.gz

############################################################
# Some basic config
############################################################

# Optional: Define mountable directories.
# Can also be accomplished using the --volume flag or by defining volumnes in
# the docker-compose.yml file
# VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Create certs directory in /etc/nginx/
RUN \
  mkdir /etc/nginx/certs

# Define starting point.
RUN mkdir /etc/service/app
COPY Procfile /etc/service/app/
COPY run /etc/service/app/run


# This came from docker-gen
ENV DOCKER_HOST unix:///tmp/docker.sock


# Expose ports.
EXPOSE 80
EXPOSE 443


# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
