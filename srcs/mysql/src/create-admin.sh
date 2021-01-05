#!/bin/sh
echo "create database wordpress;" | mysql -u root
echo "create user admin@localhost identified by 'admin';" | mysql -u root
echo "grant all privileges on *.* to admin@localhost;" | mysql -u root
echo "flush privileges;" | mysql -u root
echo "quit" | mysql -u root