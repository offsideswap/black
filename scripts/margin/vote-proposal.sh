#!/usr/bin/env bash

set -x

blackfuryd tx gov vote 2 yes \
  --from ${BLACK_ACT} \
  --keyring-backend test \
  --chain-id="${BLACKFURY_CHAIN_ID}" \
  --node="${BLACKFURY_NODE}" \
  --fees=100000000000000000fury \
  --broadcast-mode=block \
  -y