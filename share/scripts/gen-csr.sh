#!/bin/bash
sudo service puppet stop
wait
sudo puppet agent -t

