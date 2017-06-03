#!/usr/bin/env bash

set -eux

# Locale settings
export BOX_LOCALE="ru_RU"
export BOX_ENCODING="UTF-8"

echo "LC_ALL=$BOX_LOCALE.$BOX_ENCODING" >> environment.tmp
echo "LANG=$BOX_LOCALE.$BOX_ENCODING" >> environment.tmp
echo "LANGUAGE=$BOX_LOCALE.$BOX_ENCODING" >> environment.tmp
sudo bash -c 'cat environment.tmp >> /etc/environment'
rm environment.tmp

sudo localedef $BOX_LOCALE.$BOX_ENCODING -i $BOX_LOCALE -f$BOX_ENCODING

# Install common packages
sudo apt-get -y update

# install nginx
sudo apt-get -y --force-yes -q install nginx

# install postgresql
sudo apt-get -y install postgresql postgresql-server-dev-all python-psycopg2

# install node.js
until `wget https://deb.nodesource.com/setup_4.x`
do
    echo "repeat wget"
done

sudo bash setup_4.x

sudo apt-get install -y nodejs

rm setup_4.x
