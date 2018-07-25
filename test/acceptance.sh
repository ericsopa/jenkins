#!/bin/bash
return=$(curl -s -o /dev/null -w "%{http_code}" http://10.0.0.11:8000/login?from=%2F)
if [ "$return" == "200" ]; then
	echo "Passed Acceptance Testing"
else
	echo "Failed Acceptace Testing, HTTP return: $return"
fi
