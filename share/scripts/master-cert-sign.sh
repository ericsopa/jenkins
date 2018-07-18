#!/bin/bash
sudo puppet cert list --debug
sudo puppet cert sign agent.attlocal.net --debug
