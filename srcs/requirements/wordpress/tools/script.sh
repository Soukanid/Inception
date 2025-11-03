#!/bin/bash

WP_DIR="/var/www/html"
WP_CLI_PATH="/usr/local/bin/wp"

mkdir -p "$WP_DIR"

cd "$WP_DIR"

rm -rf * 

# Downloads WordPress Command Line Interface

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar "$WP_CLI_PATH"

# Downloads WordPress core files

wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

chown -R www-data:www-data /var/www/html


sed -i -r "s/wordpress/$BDD_NAME/g"   wp-config.php
sed -i -r "s/user/$BDD_USER/g"  wp-config.php
sed -i -r "s/pwd/$BDD_USER_PASSWORD/g"    wp-config.php

# install WordPress with admin user

wp core install \
    --url="$DOMAIN_NAME/" \
    --title="$WP_TITLE" \
    --admin_user="$WP_ADMIN_USER" \
    --admin_password="$WP_ADMIN_PASSWORD" \
    --admin_email="$WP_ADMIN_EMAIL" \
    --skip-email \
    --allow-root 

# create a new user

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

wp theme install astra --activate --allow-root

wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root/

# Switch PHP_FPM from Unix socket to TCP port 9000

sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm8.2 -F
