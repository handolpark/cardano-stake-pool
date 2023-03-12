#!/usr/bin/env bash

set -e -o pipefail

if [[ -z $1 ]]
then
    echo "envname must be specified."
    exit 1
fi

ENVNAME="$1"

CONFIG_BASE_URL="https://book.world.dev.cardano.org/environments/${ENVNAME}"

FILE_LIST=(
    "config.json"
    "db-sync-config.json"
    "submit-api-config.json"
    "topology.json"
    "byron-genesis.json"
    "shelley-genesis.json"
    "alonzo-genesis.json"
)

for file in "${FILE_LIST[@]}"
do
    curl -O "${CONFIG_BASE_URL}/${file}"
done
