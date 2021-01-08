#!/bin/sh

rc-service influxdb start &> /dev/null
influx -execute 'create database influxdb'
tail -f /dev/null