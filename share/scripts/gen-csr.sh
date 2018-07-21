#!/bin/bash

echo Stop puppet
sudo service puppet stop

echo Run puppet agent test with 30 second wait
sudo puppet agent -t -w 10
