#!/bin/sh

# echo "create user admin@localhost identified by 'admin';" | mysql -u root
# echo "grant all privileges on *.* to admin@localhost;" | mysql -u root
# echo "flush privileges;" | mysql -u root
# echo "quit" | mysql -u root

mkdir -p /run/mysqld
mkdir -p /var/lib/mysql

if [ ! -d /var/lib/mysql/mysql ]
then
    echo '-----------INSTALL-----------'
    mysql_install_db --user=root --datadir=/var/lib/mysql

    echo '-----------SETUP-----------'
    /usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap <<EOF
FLUSH PRIVILEGES;
CREATE DATABASE wordpress;
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';
FLUSH PRIVILEGES;
EOF

    echo '-----------SETUP WORDPRESS-----------'
    /usr/bin/mysqld --user=root --datadir=/var/lib/mysql --bootstrap < /wordpress.sql
fi

echo '-----------DEAMON-----------'
exec /usr/bin/mysqld --user=root --datadir=/var/lib/mysql