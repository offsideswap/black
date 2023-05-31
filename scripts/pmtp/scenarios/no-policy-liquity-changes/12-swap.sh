#!/usr/bin/env bash

set -x

blackfuryd tx clp swap \
  --from $BLACK_ACT \
  --keyring-backend test \
  --sentSymbol fury \
  --receivedSymbol cusdt \
  --sentAmount 100000000000000000000000 \
  --minReceivingAmount 0 \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y