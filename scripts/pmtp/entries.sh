#!/usr/bin/env bash

set -x

blackfuryd q tokenregistry entries \
    --node ${BLACKFURY_NODE} \
    --chain-id $BLACKFURY_CHAIN_ID | jq