#!/usr/bin/env bash

set -x

blackfuryd tx margin update-pools ./pools.json \
  --closed-pools ./closed-pools.json \
  --from=$BLACK_ACT \
  --keyring-backend=test \
  --fees 100000000000000000fury \
  --gas 500000 \
  --node ${BLACKFURY_NODE} \
  --chain-id=$BLACKFURY_CHAIN_ID \
  --broadcast-mode=block \
  -y