#!/usr/bin/env bash

set -x

blackfuryd q clp pool cusdt \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID