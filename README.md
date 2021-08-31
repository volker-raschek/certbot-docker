# certbot-docker

[![Build Status](https://drone.cryptic.systems/api/badges/volker.raschek/certbot-docker/status.svg)](https://drone.cryptic.systems/volker.raschek/certbot-docker)
[![Docker Pulls](https://img.shields.io/docker/pulls/volkerraschek/certbot)](https://hub.docker.com/r/volkerraschek/certbot)

This project contains all sources to build the container image
`docker.io/volkerraschek/certbot`. The primary goal of the image is to run
certbot inside a container to support distributions which does not deploy a
newer version of certbot.

## Usage

The certbot binary is defined as entrypoint. Here is an example how to get the
`help` menue from certbot.

```bash
docker run \
  --rm \
  --volume="/etc/letsencrypt:/etc/letsencrypt:rw" \
  volkerraschek/certbot-docker:latest \
  help
```

If you have existing certificates, you can renew your certificates with `renew --noninteractive`.
Here the example.

```bash
docker run \
  --rm \
  --volume="/etc/letsencrypt:/etc/letsencrypt:rw" \
  volkerraschek/certbot-docker:latest \
  renew --noninteractive
```

Alternatively you can use a `docker-compose.yml`.

```bash
version: "3"
services:
  certbot:
    container_name: certbot
    # certbot command which should be executed
    command: renew --noninteractive
    image: volkerraschek/certbot-docker:latest
    volumes:
    - /etc/letsencrypt:/etc/letsencrypt
```

## Build image manually

To build the images manually check out the
[repository](https://github.com/volker-raschek/certbot-docker) with `git` and use
the `make` command to build the container images.

```bash
make container-image/build
```
