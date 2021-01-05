#!/bin/sh

echo "create database wordpress;" | mysql -u root
echo "create user admin" | mysql -u root
echo "grant all privileges on wordpress.* to 'admin'@'%' identified by 'admin';" | mysql -u root
echo "flush privileges;" | mysql -u root
echo "quit" | mysql -u root
