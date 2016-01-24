FROM buildpack-deps:jessie

RUN apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
    xvfb \
    chromium \
    openjdk-7-jre-headles \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash - && apt-get install -y nodejs

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/chromium-browser

ADD chromium-browser /usr/bin/chromium-browser
RUN chmod a+x /usr/bin/chromium-browser
