#!/usr/bin/env bash

# mount_dir=$1 

docker run --rm -t -p 8888:8888 -v ${1-$(pwd)}:/home/eric/project jupyterlab