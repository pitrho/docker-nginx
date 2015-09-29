# Build a docker image for nginx on Ubuntu 12.04LTS.
#
#

FROM        ubuntu:12.04
MAINTAINER  pitrho

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
# Can also be accomplished using fig by defining mount
# volumes in fig.yaml
# VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Create certs directory in /etc/nginx/
RUN \
  mkdir /etc/nginx/certs

# Define working directory.
COPY . /app/
WORKDIR /app/


# This came from docker-gen
ENV DOCKER_HOST unix:///tmp/docker.sock

# Define default command.
CMD ["forego", "start", "-r"]

# Expose ports.
EXPOSE 80
EXPOSE 443
