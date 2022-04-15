FROM docker.io/library/alpine:3.15.4

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]