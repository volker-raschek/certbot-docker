FROM docker.io/library/alpine:3.21.3

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]