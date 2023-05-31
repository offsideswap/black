#!/usr/bin/env bash

set -x

blackfuryd tx margin dewhitelist black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd \
  --from $BLACK_ACT \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y