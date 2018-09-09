# http://wiki.alpinelinux.org/wiki/Creating_an_Alpine_package
# https://github.com/alpinelinux/aports
# https://hub.docker.com/_/alpine/
FROM alpine:latest

ARG user="nicolaw"
ARG user_name="Nicola Worthington"
ARG user_email="nicolaw@tfb.net"

RUN apk add alpine-sdk vim less bash bc grep findutils

RUN mkdir -pv /var/cache/distfiles
RUN chmod g+w /var/cache/distfiles
RUN chgrp abuild /var/cache/distfiles

RUN adduser -s /bin/bash -h "/home/${user}" -D "${user}"
RUN addgroup "${user}" abuild
RUN chown -R "${user}" "/home/${user}/"

RUN echo "${user} ALL=(ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

RUN git config --global user.name "${user_name}"
RUN git config --global user.email user.email "${user_email}"

USER "${user}"
WORKDIR "/home/${user}"

RUN git clone --depth 1 git://git.alpinelinux.org/aports
RUN abuild-keygen -a -i

