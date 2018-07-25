#!/bin/bash
echo gen-certs: Stop puppetmaster
sudo service puppetmaster stop

echo gen-certs: Gen certs
sudo -u puppet puppet master --no-daemonize –-verbose &
sleep 10
kill %1

echo gen-erts: Start puppetmaster
sudo puppet resource service puppetmaster ensure=running

echo gen-erts: Check puppetmaster
sudo service puppetmaster status
