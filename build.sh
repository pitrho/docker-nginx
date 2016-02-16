#!/bin/bash

IMAGE_TAG="pitrho/nginx"

# Custom die function.
#
die() { echo >&2 -e "\nRUN ERROR: $@\n"; exit 1; }

# Parse the command line flags.
#
while getopts "v:t:" opt; do
  case $opt in
    t)
      IMAGE_TAG=${OPTARG}
      ;;

    v)
      REDIS_VERSION=${OPTARG}
      ;;

    \?)
      die "Invalid option: -$OPTARG"
      ;;
  esac
done

docker build -t="${IMAGE_TAG}" .
