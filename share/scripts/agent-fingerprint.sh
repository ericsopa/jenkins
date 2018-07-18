#!/bin/bash
sudo puppet resource service puppet ensure=running
sudo service puppet status
sudo puppet agent --fingerprint --debug
sudo puppet agent -t --debug

