FROM docker.io/library/alpine:3.18.3

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]