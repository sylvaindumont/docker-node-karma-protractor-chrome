FROM node:16-alpine3.16

RUN sed -i -e 's/v3.16/edge/g' /etc/apk/repositories \
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
