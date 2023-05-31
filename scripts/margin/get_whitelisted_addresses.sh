#!/usr/bin/env bash

set -x

blackfuryd q margin whitelist \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID