#!/bin/bash
echo master-cert-sign: Sign certs
sudo puppet cert list
sudo puppet cert sign --all
