FROM buildpack-deps:jessie

RUN apt-get update && apt-get install -y xvfb chromium curl

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

ADD entrypoint.sh /entrypoint.sh
ENV DISPLAY :99.0
RUN chmod 755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
