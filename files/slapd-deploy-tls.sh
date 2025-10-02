#!/bin/bash

DOMAIN=$1
FULLCHAIN_PATH="/etc/letsencrypt/live/${DOMAIN}/fullchain.pem"
PRIVKEY_PATH="/etc/letsencrypt/live/${DOMAIN}/privkey.pem"

cp $FULLCHAIN_PATH /etc/openldap/${DOMAIN}.crt
cp $PRIVKEY_PATH /etc/openldap/${DOMAIN}.key
chown ldap:ldap /etc/openldap/${DOMAIN}.crt /etc/openldap/${DOMAIN}.key

systemctl restart slapd
