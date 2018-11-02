#!/bin/bash

# Retrieve blacklist database
if [  "${BLACKLIST_URL}" != "" ]; then
	wget -O backlist.tar.gz ${BLACKLIST_URL} \
 		&& tar -zxvf backlist.tar.gz -C /var/lib/squidguard/db \
 		&& rm backlist.tar.gz \
 		&& chown proxy:proxy /var/lib/squidguard/db -R
fi

# Creates cache dir if needed
/usr/sbin/squid -N -z -f /etc/squid/squid.conf

# Run squid
exec /usr/sbin/squid -N -f /etc/squid/squid.conf
