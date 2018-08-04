#!/bin/bash

if [ ! -f /var/lib/puppet/state/agent_catalog_run.lock ]; then
    echo "Lock file not present, run Puppet agent!"
    sudo puppet agent -t
fi

while [ -e /var/lib/puppet/state/agent_catalog_run.lock ];
do
    sleep 5
    echo lock file present, Puppet is deploying Jenkins
done

echo "Jenkins should be running on http://10.0.0.11:8000"
../../test/acceptance.sh
