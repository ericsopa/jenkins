#!/bin/bash
echo Stop puppetmaster
sudo service puppetmaster stop
wait

echo Gen certs
timeout 15s sudo -u puppet puppet master --no-daemonize –verbose 

echo Start puppetmaster
puppet resource service puppetmaster ensure=running
wait

echo Check puppetmaster
service puppetmaster status
