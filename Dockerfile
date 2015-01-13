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
    python-software-properties

############################################################
# Install nginx
############################################################

RUN \
  apt-add-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx && \
  apt-get clean


############################################################
# Some basic config
############################################################

# Optional: Define mountable directories.
# Can also be accomplished using fig by defining mount
# volumes in fig.yaml
# VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
