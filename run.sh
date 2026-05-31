#!/bin/sh
mariadb --skip-ssl -u "$DB_ROOT_USERNAME" -h db -p"$DB_ROOT_PASSWORD" < /usr/local/share/createDB.sql
exec /opt/keycloak/bin/kc.sh start
