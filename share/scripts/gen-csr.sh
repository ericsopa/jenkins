#!/bin/bash

echo Stop puppet
sudo service puppet stop

echo Run puppet agent test and wait for cert
sudo puppet agent -t -w 15
