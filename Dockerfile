FROM docker.io/library/archlinux:latest

RUN pacman --sync --sysupgrade --refresh --noconfirm certbot bind-tools

ENTRYPOINT [ "certbot" ]