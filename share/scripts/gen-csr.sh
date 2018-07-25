#!/bin/bash

echo gen-csr: Stop puppet
sudo service puppet stop

echo gen-csr: Run puppet agent test and wait for cert
sudo puppet agent -t -w 20
