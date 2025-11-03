#!/bin/sh

mkdir -p /var/run/mysqld
chown mysql:mysql /var/run/mysqld

mysqld &

sleep 5

echo "CREATE DATABASE IF NOT EXISTS $BDD_NAME;" | mysql
echo "CREATE USER IF NOT EXISTS '$BDD_USER'@'%' IDENTIFIED BY '$BDD_USER_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON $BDD_NAME.* TO '$BDD_USER'@'%';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

wait
