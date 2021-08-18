FROM archlinux

ARG NB_USER="eric"
ARG NB_UID="1000"
ARG NB_GID="1000"

WORKDIR /tmp

COPY pacman_pkglist.txt ./
RUN pacman -Sy --noconfirm && \
    pacman -Syu --noconfirm && \
    pacman -S --noconfirm - < pacman_pkglist.txt 

COPY pip_pkglist.txt ./
RUN pip install -r pip_pkglist.txt

WORKDIR /home/${NB_USER}/project

RUN useradd -u ${NB_UID} ${NB_USER} && \
    chown -R ${NB_UID}:${NB_GID} /home/${NB_USER}
USER eric

CMD jupyter lab --ip=0.0.0.0