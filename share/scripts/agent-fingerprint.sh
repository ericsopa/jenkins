#!/bin/bash
echo Ensure puppet agent is running...
sudo puppet resource service puppet ensure=running

echo Confirm puppet agent status
sudo service puppet status

echo Check agent finger print
sudo puppet agent --fingerprint --debug

echo Agent check in
sudo puppet agent -t --debug

