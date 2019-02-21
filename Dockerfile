FROM node:10-stretch

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
    chromium=70.0.3538.110-1~deb9u1 \
    libgconf-2-4 \
    openjdk-8-jre-headless \
    && rm -rf /var/lib/apt/lists/*

ENV CHROME_BIN /usr/bin/chromium
