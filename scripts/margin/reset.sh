#!/usr/bin/env bash

set -x

blackfuryd tx clp pmtp-rates \
  --blockRate=0.00 \
  --runningRate=0.00 \
  --from=$BLACK_ACT \
  --keyring-backend=test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id=$BLACKFURY_CHAIN_ID \
  --broadcast-mode=block \
  -y