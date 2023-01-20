FROM docker.io/library/alpine:3.17.1

RUN apk update && apk add certbot bind-tools

ENTRYPOINT [ "certbot" ]