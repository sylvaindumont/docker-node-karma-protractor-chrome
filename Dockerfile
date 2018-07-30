FROM node:8-alpine

RUN sed -i -e 's/v3.6/edge/g' /etc/apk/repositories \
    && apk upgrade --no-cache --available \
    && apk add --no-cache \
    python \
    build-base \
    git \
    bash \
    openjdk8-jre-base \
    # chromium dependencies
    nss \
    chromium-chromedriver \
    chromium

USER node

ENV CHROME_BIN /usr/bin/chromium-browser
