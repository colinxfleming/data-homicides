FROM alpine:latest
MAINTAINER Colin Fleming <c3flemin@gmail.com>

RUN apk update && apk add postgresql-client

RUN mkdir -p /usr/src/app/ && cd /usr/src/app/
WORKDIR /usr/src/app/
COPY entrypoint.sh /usr/src/app/entrypoint.sh
