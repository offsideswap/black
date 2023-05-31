#!/usr/bin/env bash

set -x

blackfuryd tx clp reward-params \
  --cancelPeriod 43200 \
  --lockPeriod 100800 \
  --from=$BLACK_ACT \
  --keyring-backend=test \
  --fees 100000000000000000fury \
  --gas 500000 \
  --node ${BLACKFURY_NODE} \
  --chain-id=$BLACKFURY_CHAIN_ID \
  --broadcast-mode=block \
  -y

# blackfuryd tx clp reward-params \
#   --cancelPeriod 66825 \
#   --lockPeriod 124425 \
#   --from=$BLACK_ACT \
#   --keyring-backend=test \
#   --fees 100000000000000000fury \
#   --gas 500000 \
#   --node ${BLACKFURY_NODE} \
#   --chain-id=$BLACKFURY_CHAIN_ID \
#   --broadcast-mode=block \
#   -y

# blackfuryd tx clp reward-params \
#   --cancelPeriod 66825 \
#   --lockPeriod 100800 \
#   --from=$BLACK_ACT \
#   --keyring-backend=test \
#   --fees 100000000000000000fury \
#   --gas 500000 \
#   --node ${BLACKFURY_NODE} \
#   --chain-id=$BLACKFURY_CHAIN_ID \
#   --broadcast-mode=block \
#   -y