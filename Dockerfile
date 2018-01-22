FROM node:6-alpine

RUN echo @edge http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
    && apk add --no-cache \
    python \
    build-base \
    git \
    bash \
    openjdk8-jre-base \
    # chromium dependencies
    nss@edge \
    chromium-chromedriver@edge \
    chromium@edge \
    && addgroup -S chromium && adduser -S -g chromium chromium \
    && mkdir -p /home/chromium \
    && chown -R chromium:chromium /home/chromium

USER chromium

ENV CHROME_BIN /usr/bin/chromium-browser
