#!/usr/bin/env bash

set -x

blackfuryd q margin \
  positions-for-address $ADMIN_ADDRESS \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID