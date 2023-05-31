#!/usr/bin/env bash

set -x

blackfuryd q clp reward-params \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID