FROM ubuntu:trusty
MAINTAINER Ryan Seto <ryanseto@yak.net>

RUN     apt-get update && \
        apt-get -y upgrade && \
        apt-get -y install tinyproxy && \
        rm -rf /var/lib/apt/lists/*

# Ensure UTF-8
RUN locale-gen en_US.UTF-8
ENV LANG       en_US.UTF-8
ENV LC_ALL     en_US.UTF-8

RUN chmod 777 -R /var/log/tinyproxy
RUN mkdir -p /var/run/tinyproxy && \
    chmod 777 -R /var/run/tinyproxy

RUN chown -R 1000070000:nogroup /

EXPOSE 8888
USER 1000070000
ENTRYPOINT ["/usr/sbin/tinyproxy", "-d"]
