FROM debian:latest

RUN apt-get update && apt-get install -f -y \
    squid \
    squidguard \
    wget

VOLUME "/etc/squid"
VOLUME "/etc/squidguard"
VOLUME "/var/lib/squidguard"
VOLUME "/var/spool/squid"
VOLUME "/var/log/squid"

EXPOSE 3128

ADD entrypoint.sh /
ADD squid.conf /etc/squid/
ADD squidGuard.conf /etc/squidguard

# Make squid creates cache directories
RUN /usr/sbin/squid -N -z -f /etc/squid/squid.conf

CMD /entrypoint.sh
