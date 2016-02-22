#!/usr/bin/env sh

sed "s;sqlite:///ctfd.db;mysql+pymysql://${MYSQL_USER}:${MYSQL_PASSWORD}@db/ctfd;g" /opt/CTFd/CTFd/config.py -i

exec "$@"
