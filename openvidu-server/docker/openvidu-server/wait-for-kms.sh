#!/bin/sh

# Bash options for strict error checking
RC=0
MAX_ATTEMPTS=300
ATTEMPS_COUNTER=0

until [ "$RC" -eq "500" ]; do
ATTEMPS_COUNTER=$(($ATTEMPS_COUNTER+1))

if [ ${ATTEMPS_COUNTER} -eq ${MAX_ATTEMPTS} ]; then
  exit 1
fi

RC="$(curl \
    --silent \
    --no-buffer \
    --write-out '%{http_code}' \
    --header "Connection: Upgrade" \
    --header "Upgrade: websocket" \
    --header "Host: 127.0.0.1:8888" \
    --header "Origin: 127.0.0.1" \
    http://127.0.0.1:8888/kurento)"

    echo "KMS is unavailable - sleeping"
    sleep 1
done

echo "KMS is running"

