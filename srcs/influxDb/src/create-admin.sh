#!/bin/sh
influx -execute 'create user 'admin' with password 'admin' with all privileges'
influx -execute 'create database influxdb'