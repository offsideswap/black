#!/bin/sh

set -x

blackfuryd tx clp remove-liquidity-units \
  --withdrawUnits 1 \
  --symbol ceth \
  --from $BLACK_ACT \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y