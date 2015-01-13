# Docker Precise nginx
This repository contains a `Dockerfile` for building an [nginx](http://nginx.org/)
Docker image from an [Ubuntu 12.04 LTS](http://releases.ubuntu.com/precise/)
base image.

This particular nginx Docker image makes it easy to 

* Deploy nginx
* Mount system volumes for configuration or use [fig](https://github.com/docker/fig) to do so.


## Building the image

Clone the repository

    export IMGTAG="pitrho/precise-nginx"
    git clone https://github.com/pitrho/docker-precise-nginx.git
    cd docker-precise-nginx
    docker build -t $IMGTAG .

Verify you have the image locally

    docker images | grep "$IMGTAG"


