#!/bin/bash
echo Stop puppetmaster
sudo service puppetmaster stop

echo Gen certs
sudo -u puppet puppet master --no-daemonize –-verbose &
sleep 5
kill %1

echo Start puppetmaster
sudo puppet resource service puppetmaster ensure=running

echo Check puppetmaster
sudo service puppetmaster status
