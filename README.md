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

## Run modes

The image can be run in three separate modes:
[docker-gen](https://github.com/jwilder/docker-gen),
[rancher-gen](https://github.com/pitrho/rancher-gen) and default

### Running using docker-gen
To use docker-gen, you must set environment variable NGINX_RUN_TYPE to
docker-gen. In addition, you must mount the docker socket as a volume into
the container (e.g. -v /var/run/docker.sock:/tmp/docker.sock). Please consult
the docker-gen documentation to see all options available to this program.

### Running using rancher-gen
To use docker-gen, you must set environment variable NGINX_RUN_TYPE to
rancher-gen. In addition, you need to pass the following environment variables:
  * RANCHER_GEN_HOST: The ip or dns name of the Rancher server
  * RANCHER_GEN_ACCESS_KEY: The Rancher access key
  * RANCHER_GEN_SECRET_KEY: The Rancher secret key
  * RANCHER_GEN_PROJECT_ID: The project id from Rancher
  * $RANCHER_GEN_OPTIONS(optional): You can pass additional values to
    rancher-gen using this variable.

Please consult the rancher-gen documentation for more details.

### Running in default mode
Default mode simply runs nginx with its default configuration.
