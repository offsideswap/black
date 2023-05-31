#!/usr/bin/env bash

set -x

blackfuryd tx margin close \
  --from $BLACK_ACT \
  --id 7 \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y