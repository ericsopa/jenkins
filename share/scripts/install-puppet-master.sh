#!/bin/bash
sudo yum -y install puppet-server
wait
sudo service puppetmaster start
wait
sudo service puppetmaster start
wait
timeout 15s sudo -u puppet puppet master --no-daemonize –verbose 
wait
puppet resource service puppetmaster ensure=running
wait
service puppetmaster status

