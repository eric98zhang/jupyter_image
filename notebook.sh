#!/usr/bin/env bash

# mount_dir=$1 
USER="eric"

docker run --rm -it -p 8888:8888 \
    -v ${1-$(pwd)}:/home/$USER/project \
    -v /home/$USER/.jupyter:/home/$USER/.jupyter \
    jupyterlab