#!/usr/bin/env bash

set -x

blackfuryd q clp pmtp-params \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID