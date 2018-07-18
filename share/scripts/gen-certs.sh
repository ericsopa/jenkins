#!/bin/bash
echo Stop puppetmaster
sudo service puppetmaster stop

echo Gen certs
imeout 15s sudo -u puppet puppet master --no-daemonize –verbose 
sleep 16

echo Start puppetmaster
sudo puppet resource service puppetmaster ensure=running

echo Check puppetmaster
sudo service puppetmaster status
