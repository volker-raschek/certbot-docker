FROM docker.io/library/alpine:latest

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]