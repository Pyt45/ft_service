#!/bin/sh
influx -execute "CREATE USER \"admin\" WITH PASSWORD 'admin' WITH ALL PRIVILEGES"
influx -username admin -password admin -execute "CREATE DATABASE influxdb"
/usr/bin/supervisord