#!/bin/sh

echo "create user admin@localhost identified by 'admin';" | mysql -u root
echo "grant all privileges on *.* to admin@localhost;" | mysql -u root
echo "flush privileges;" | mysql -u root
echo "quit" | mysql -u root

# mkdir -p /run/mysqld
# mkdir -p /var/lib/mysql

# if [ ! -d /var/lib/mysql/mysql ]
# then
#     echo '-----------INSTALL-----------'
#    /usr/bin/mysql_install_db --user=admin --datadir=/var/lib/mysql

#     echo '-----------SETUP-----------'
#     /usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql --bootstrap <<EOF
# CREATE DATABASE wordpress;
# CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
# GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost' IDENTIFIED BY 'admin';
# FLUSH PRIVILEGES;
# EXIT
# EOF

#     # echo '-----------SETUP WORDPRESS-----------'
#     # /usr/bin/mysqld --user=mysql --datadir=/var/lib/mysql --bootstrap < /wordpress.sql
# fi

# echo '-----------DEAMON-----------'
# exec /usr/bin/mysqld --user=admin --datadir=/var/lib/mysql