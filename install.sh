#!/bin/bash
if [ ! -f /app/parallelTests/app/config/parameters.yml ]; then

mysqld_safe &
sleep 10s
mysql -u root -h localhost -e "CREATE USER 'acme'@'localhost' IDENTIFIED BY 'Acme'; CREATE DATABASE acme; GRANT ALL PRIVILEGES ON acme.* TO 'acme'@'localhost'; FLUSH PRIVILEGES;"

# Install dependencies
cd /app/parallelTests && composer install --no-interaction

# Configure the application
sed -e "s/database_name:     symfony/database_name:     acme/
s/database_user:     root/database_user:     acme/
s/database_password: ~/database_password: Acme/g" /app/parallelTests/app/config/parameters.yml.dist > /app/parallelTests/app/config/parameters.yml

fi
