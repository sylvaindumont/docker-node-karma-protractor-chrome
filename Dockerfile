FROM node:alpine

RUN apk add --no-cache \
    python \
    build-base \
    git \
    bash \
    chromium libexif udev \
    openjdk8-jre-base

ENV CHROME_BIN /usr/bin/chromium-browser
