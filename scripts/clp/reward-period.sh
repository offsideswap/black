#!/bin/sh

set -x

blackfuryd tx clp reward-period \
  --path reward-period.json \
  --from $BLACK_ACT \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y