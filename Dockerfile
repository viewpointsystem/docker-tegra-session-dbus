FROM debian:buster-slim as base

ENV DEBIAN_FRONTEND=noninteractive

RUN set -ex \
    && apt-get -yqq update \
    && apt-get install -yq \ 
        dbus \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*

COPY dbus.conf /
COPY start.sh /

CMD /start.sh

