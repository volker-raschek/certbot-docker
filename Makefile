# CONTAINER_RUNTIME
# The CONTAINER_RUNTIME variable will be used to specified the path to a
# container runtime. This is needed to start and run a container image.
CONTAINER_RUNTIME?=$(shell which podman)

# CERTBOT_IMAGE_REGISTRY_NAME
# Defines the name of the new container to be built using several variables.
CERTBOT_IMAGE_REGISTRY_NAME:=git.cryptic.systems
CERTBOT_IMAGE_REGISTRY_USER:=volker.raschek

CERTBOT_IMAGE_NAMESPACE?=${CERTBOT_IMAGE_REGISTRY_USER}
CERTBOT_IMAGE_NAME:=certbot
CERTBOT_IMAGE_VERSION?=latest
CERTBOT_IMAGE_FULLY_QUALIFIED=${CERTBOT_IMAGE_REGISTRY_NAME}/${CERTBOT_IMAGE_NAMESPACE}/${CERTBOT_IMAGE_NAME}:${CERTBOT_IMAGE_VERSION}
CERTBOT_IMAGE_UNQUALIFIED=${CERTBOT_IMAGE_NAMESPACE}/${CERTBOT_IMAGE_NAME}:${CERTBOT_IMAGE_VERSION}

# BUILD CONTAINER IMAGE
# ==============================================================================
PHONY:=container-image/build
container-image/build:
	${CONTAINER_RUNTIME} build \
		--file Dockerfile \
		--no-cache \
		--pull \
		--tag ${CERTBOT_IMAGE_FULLY_QUALIFIED} \
		--tag ${CERTBOT_IMAGE_UNQUALIFIED} \
		.

# DELETE CONTAINER IMAGE
# ==============================================================================
PHONY:=container-image/delete
container-image/delete:
	- ${CONTAINER_RUNTIME} image rm ${CERTBOT_IMAGE_FULLY_QUALIFIED} ${CERTBOT_IMAGE_UNQUALIFIED}
	- ${CONTAINER_RUNTIME} image rm ${BASE_IMAGE_FULL}

# PUSH CONTAINER IMAGE
# ==============================================================================
PHONY+=container-image/push
container-image/push:
	echo ${CERTBOT_IMAGE_REGISTRY_PASSWORD} | ${CONTAINER_RUNTIME} login ${CERTBOT_IMAGE_REGISTRY_NAME} --username ${CERTBOT_IMAGE_REGISTRY_USER} --password-stdin
	${CONTAINER_RUNTIME} push ${CERTBOT_IMAGE_FULLY_QUALIFIED}

# PHONY
# ==============================================================================
# Declare the contents of the PHONY variable as phony.  We keep that information
# in a variable so we can use it in if_changed.
.PHONY: ${PHONY}