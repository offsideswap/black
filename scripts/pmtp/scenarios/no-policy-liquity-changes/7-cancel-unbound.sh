#!/usr/bin/env bash

set -x

blackfuryd tx clp cancel-unbond \
  --from $BLACK_ACT \
  --keyring-backend test \
  --symbol cusdt \
  --units 1000000000 \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y