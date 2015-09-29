# Docker Precise nginx
This folder contains a `Dockerfile` for building an [nginx](http://nginx.org/)
Docker image from an [Ubuntu 12.04 LTS](http://releases.ubuntu.com/precise/)
base image.

## Building the image

Clone the repository

    export IMGTAG="pitrho/precise-nginx"
    git clone https://github.com/pitrho/docker-nginx.git
    cd docker-nginx/ubuntu/12.04
    docker build -t $IMGTAG .

Verify you have the image locally

    docker images | grep "$IMGTAG"
