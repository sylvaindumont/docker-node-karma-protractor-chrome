FROM buildpack-deps:jessie

RUN apt-get update && apt-get install -y xvfb chromium curl

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

ENV DISPLAY :99
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

CMD ["/entrypoint.sh"]
