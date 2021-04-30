FROM node:14-alpine3.13

RUN sed -i -e 's/v3.13/edge/g' /etc/apk/repositories  \
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

ENV CHROME_BIN /usr/bin/chromium-browser
