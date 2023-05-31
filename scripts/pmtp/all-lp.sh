#!/usr/bin/env bash

set -x

blackfuryd q clp all-lp \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID