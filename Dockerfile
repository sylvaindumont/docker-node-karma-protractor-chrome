FROM node:alpine

RUN apk add --no-cache \
    python \
    build-base \
    git \
    bash \
    openjdk8-jre-base \
    # chromium dependencies
    libexif \
    udev \
    freetype \
    glib-dev \
    ttf-freefont \
    chromium

ENV CHROME_BIN /usr/bin/chromium-browser
