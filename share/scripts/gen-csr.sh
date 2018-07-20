#!/bin/bash

echo Stop puppet
sudo service puppet stop

echo Run puppet agent test with 120 second wait
sudo puppet agent -t -w 30
