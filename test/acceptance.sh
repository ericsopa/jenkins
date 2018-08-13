#!/bin/bash

counter=1
while [ $counter -le 60 ]
do
    httpcode=$(curl -s -o /dev/null -w "%{http_code}" http://10.0.0.11:8000/login?from=%2F)
    if [ "$httpcode" == "200" ]; then
    	echo "Passed Acceptance Testing, Jenkins is listening on port 8000"
	exit 0
    fi

    sleep 1
    echo -n "Testing for $counter of 60 seconds"
    ((counter++))
done
echo ""
echo "Failed Acceptace Testing, HTTP httpcode: $httpcode"
echo "Could be a false negative, go to browser and try connecting anyway or rerun the test"
