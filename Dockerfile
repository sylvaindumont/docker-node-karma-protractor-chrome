FROM node:10-stretch

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
    chromium \
    libatk-bridge2.0-0 \
    libgconf-2-4 \
    openjdk-8-jre-headless \
    && rm -rf /var/lib/apt/lists/*

USER node

ENV CHROME_BIN /usr/bin/chromium
