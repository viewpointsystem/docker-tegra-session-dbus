FROM debian:buster-slim as base

ENV DEBIAN_FRONTEND=noninteractive
RUN groupadd -g 1001 nvidia \
    && useradd -r -u 1001 -g nvidia nvidia \
    && mkdir -p /var/run/dbus/vps \
    && chown -R nvidia /var/run/dbus/vps


RUN set -ex \
    && apt-get -yqq update \
    && apt-get install -yq \ 
        dbus \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/*

COPY dbus.conf /
COPY start.sh /

USER nvidia
VOLUME /var/run/dbus/vps
CMD /start.sh

