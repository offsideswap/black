#!/usr/bin/env bash

set -x

blackfuryd tx margin whitelist $ADMIN_ADDRESS \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y