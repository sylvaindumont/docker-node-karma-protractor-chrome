FROM buildpack-deps:jessie

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get update && \
    DEBIAN_FRONTEND="noninteractive" \
    apt-get install -y --no-install-recommends \
    nodejs \
    xvfb \
    chromium \
    libgconf-2-4 \
    openjdk-7-jre-headless \
    && rm -rf /var/lib/apt/lists/*
 
RUN npm install -g yarn

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/chromium

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
