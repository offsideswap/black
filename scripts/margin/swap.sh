#!/usr/bin/env bash

set -x

blackfuryd tx clp swap \
  --from=$BLACK_ACT \
  --keyring-backend=test \
  --sentSymbol=cusdc \
  --receivedSymbol=fury \
  --sentAmount=1000000000000 \
  --minReceivingAmount=0 \
  --fees=100000000000000000fury \
  --gas=500000 \
  --node=${BLACKFURY_NODE} \
  --chain-id=${BLACKFURY_CHAIN_ID} \
  --broadcast-mode=block \
  -y