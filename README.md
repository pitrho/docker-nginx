# Docker Precise nginx
This repository contains the configuration for building a [nginx](http://nginx.org/)
Docker image for both [Ubuntu 12.04 LTS](http://releases.ubuntu.com/precise/)
and [Ubuntu 14.04 LTS](http://releases.ubuntu.com/trusty/).

This particular nginx Docker image makes it easy to

* Deploy nginx
* Mount system volumes for configuration.

## Run-time
The container uses forego (foreman port in GO) to run both nginx and docker-gen.
Note that the Procfile expects the default.tmpl file to be under /nginxcfg, which
could be mounted by fig or specified when running `docker run`.

## Building the image

See this [README](ubuntu/12.04/README.md) for instructions on how to build the
Ubuntu 12.04 image.

See this [README](ubuntu/14.04/README.md) for instructions on how to build the
Ubuntu 14.04 image.
