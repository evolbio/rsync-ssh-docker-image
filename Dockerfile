# https://hub.docker.com/_/alpine/
FROM alpine:3.13


RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
            rsync \
            openssh-client \
            ca-certificates \
 && update-ca-certificates \
 && rm -rf /var/cache/apk/*

RUN addgroup -g 65537 staff

RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup staff \
    --no-create-home \
    --uid 1026 \
    steve
