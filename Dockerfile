FROM node:14-alpine3.12

RUN sed -i -e 's/v3.12/edge/g' /etc/apk/repositories \
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
