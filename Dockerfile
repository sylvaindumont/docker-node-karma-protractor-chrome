FROM node:alpine

RUN apk add --no-cache \
    chromium libexif udev \
    openjdk8-jre-base

ENV CHROME_BIN /usr/bin/chromium-browser
