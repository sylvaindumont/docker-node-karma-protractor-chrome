FROM buildpack-deps:jessie

RUN apt-get update && apt-get install -y xvfb chromium curl openjdk-8-jre-headless

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

ENV DISPLAY :99
ENV CHROME_BIN /usr/bin/chromium-browser

ADD chromium-browser /usr/bin/chromium-browser
RUN chmod a+x /usr/bin/chromium-browser
