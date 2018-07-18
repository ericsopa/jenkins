#!/bin/bash
# Stop puppetmaster
sudo service puppetmaster stop
wait

#Gen certs
timeout 15s sudo -u puppet puppet master --no-daemonize –verbose 
wait

#Start and check puppetmaster
puppet resource service puppetmaster ensure=running
wait
service puppetmaster status
