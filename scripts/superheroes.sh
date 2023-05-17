#!/bin/bash

# ./superheroes.sh apps.cluster-GUID.sandbox0001.opentlc.com 30 heroes
# ./superheroes.sh apps.cluster-GUID.sandbox0001.opentlc.com 30 villains

set -euo pipefail

SUBDOMAIN=$1
USERS=$2
SERVICE=$3

for ((i=1;i<=${USERS};i++)); do
  echo "-------------------------------------------------------------------------------------"
  echo "PUT user${i}"
  echo "-------------------------------------------------------------------------------------\n"
  curl -v -X "PUT" "http://rest-${SERVICE}-quarkus-superheroes-user${i}.${SUBDOMAIN}/api/${SERVICE}" \
  -H 'Content-Type: application/json' \
  -d @$(pwd)/${SERVICE}.json
done
