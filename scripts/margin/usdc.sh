#!/usr/bin/env bash

set -x

blackfuryd q clp pool cusdc \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID