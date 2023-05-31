#!/usr/bin/env bash

set -x

blackfuryd tx tokenregistry register denoms/fury.json \
  --node ${BLACKFURY_NODE} \
  --chain-id "${BLACKFURY_CHAIN_ID}" \
  --from "${ADMIN_ADDRESS}" \
  --keyring-backend test \
  --gas 500000 \
  --gas-prices 0.5fury \
  -y \
  --broadcast-mode block

blackfuryd tx tokenregistry register denoms/cusdt.json \
  --node ${BLACKFURY_NODE} \
  --chain-id "${BLACKFURY_CHAIN_ID}" \
  --from "${ADMIN_ADDRESS}" \
  --keyring-backend test \
  --gas 500000 \
  --gas-prices 0.5fury \
  -y \
  --broadcast-mode block