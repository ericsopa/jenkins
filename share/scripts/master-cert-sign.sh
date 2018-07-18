#!/bin/bash
sudo puppet cert list
wait
sudo puppet cert sign agent.attlocal.net
