FROM docker.io/library/alpine:3.16.1

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]