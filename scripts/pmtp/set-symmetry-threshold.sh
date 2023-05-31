#!/usr/bin/env bash

set -x

blackfuryd tx clp set-symmetry-threshold \
  --threshold=0.000000005 \
  --from=$BLACK_ACT \
  --keyring-backend=test \
  --fees=100000000000000000fury \
  --gas=500000 \
  --node=${BLACKFURY_NODE} \
  --chain-id=$BLACKFURY_CHAIN_ID \
  --broadcast-mode=block \
  -y