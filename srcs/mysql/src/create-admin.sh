#!/bin/sh
echo "create user 'admin'@'%' identified by 'admin';" | mysql -u root
echo "create database wordpress;" | mysql -u root
echo "grant all privileges on *.* to 'admin'@'%';" | mysql -u root
echo "flush privileges;" | mysql -u root
