#!/bin/bash
sudo sh -c "echo `hostname -I` puppet puppet.example.com >> /etc/hosts"
