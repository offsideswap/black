#!/bin/sh

set -x

blackfuryd tx clp set-lppd-params \
  --path lppd-params.json \
  --from $BLACK_ACT \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y