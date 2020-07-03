FROM node:10-alpine3.11

RUN sed -i -e 's/v3.11/edge/g' /etc/apk/repositories \
    && apk add --no-cache \
    python2 \
    build-base \
    git \
    bash \
    openjdk8-jre-base \
    # chromium dependencies
    nss \
    chromium-chromedriver \
    chromium \
    && apk upgrade --no-cache --available

USER node

ENV CHROME_BIN /usr/bin/chromium-browser
