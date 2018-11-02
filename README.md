This is a simple squid proxy configuration based on debian that uses squidguard

Configuration
-------------

The image is provided with simple squid and squidguard configuration. You can provide your own in

* `/etc/squid/squid.conf`
* `/etc/squidguard/squidGuard.conf`

The following environment variables can tune the running container:

* `BLACKLIST_URL` : the url of the `tar.gz` archive of a blacklist
  database compatible with squidguard. It will be automatically
  extracted to `/var/lib/squidguard/db` before starting squid
  
Volumes
-------

It can be useful to map the following folders to volumes:

* `/etc/squid` : the configuration files for squid
* `/etc/squidguard` : the configuration files for squidguard
* `/var/lib/squidguard` : the squidguard blacklist database
* `/var/spool/squid` : the squid cache
* `/var/log/squid` : the squid log files

Author
------

* Michael Hauspie

Aknowledgment
-------------

This docker image is inspired by
https://github.com/muenchhausen/docker-squidguard but is a complete
rewrite
