# Docker Precise nginx
This folder contains a `Dockerfile` for building an [nginx](http://nginx.org/)
Docker image from an [Ubuntu 14.04 LTS](http://releases.ubuntu.com/trusty/)
base image.

Unlike the [Ubuntu 12.04 configuration](../12.04/README.md), this image uses
the [phusion/baseimage](https://github.com/phusion/baseimage-docker) docker
image.

## Building the image

Clone the repository

    export IMGTAG="pitrho/trusty-nginx"
    git clone https://github.com/pitrho/docker-nginx.git
    cd docker-nginx/ubuntu/14.04
    docker build -t $IMGTAG .

Verify you have the image locally

    docker images | grep "$IMGTAG"
