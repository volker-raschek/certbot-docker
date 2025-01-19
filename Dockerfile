FROM docker.io/library/alpine:3.21.2

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]