#!/usr/bin/env bash

set -x

blackfuryd tx clp add-liquidity \
  --from $BLACK_ACT \
  --keyring-backend test \
  --symbol cusdt \
  --nativeAmount 1000000000000000000000000 \
  --externalAmount 25378853317 \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y