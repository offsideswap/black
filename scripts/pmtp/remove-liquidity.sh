#!/usr/bin/env bash

set -x

blackfuryd tx clp remove-liquidity \
  --from $BLACK_ACT \
  --keyring-backend test \
  --symbol cusdt \
  --asymmetry 0 \
  --wBasis 10 \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y