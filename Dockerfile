FROM docker.io/library/alpine:3.19.0

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]