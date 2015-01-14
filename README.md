# Docker Precise nginx
This repository contains a `Dockerfile` for building an [nginx](http://nginx.org/)
Docker image from an [Ubuntu 12.04 LTS](http://releases.ubuntu.com/precise/)
base image.

This particular nginx Docker image makes it easy to

* Deploy nginx
* Mount system volumes for configuration or use [fig](https://github.com/docker/fig) to do so.

## Run-time
The container uses forego (foreman port in GO) to run both nginx and docker-gen.
Note that the Procfile expects the default.tmpl file to be under /nginxcfg, which
could be mounted by fig or specified when running `docker run`.

## Building the image

Clone the repository

    export IMGTAG="pitrho/precise-nginx"
    git clone https://github.com/pitrho/docker-precise-nginx.git
    cd docker-precise-nginx
    docker build -t $IMGTAG .

Verify you have the image locally

    docker images | grep "$IMGTAG"
