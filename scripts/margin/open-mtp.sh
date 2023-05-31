#!/usr/bin/env bash

set -x

blackfuryd tx margin open \
  --from $BLACK_ACT \
  --keyring-backend test \
  --borrow_asset cusdc \
  --collateral_asset fury \
  --collateral_amount 1000000000000000000000 \
  --position long \
  --leverage 2 \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y