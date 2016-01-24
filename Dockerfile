FROM buildpack-deps:jessie

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash - && \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
    nodejs \
    xvfb \
    chromium \
    openjdk-7-jre-headles \
    && rm -rf /var/lib/apt/lists/*

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/chromium-browser

ADD chromium-browser /usr/bin/chromium-browser
RUN chmod a+x /usr/bin/chromium-browser
