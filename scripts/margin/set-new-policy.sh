#!/usr/bin/env bash

set -x

blackfuryd tx clp pmtp-params \
  --pmtp_start=22811 \
  --pmtp_end=224410 \
  --epochLength=14400 \
  --rGov=0.05 \
  --from=$BLACK_ACT \
  --keyring-backend=test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id=$BLACKFURY_CHAIN_ID \
  --broadcast-mode=block \
  -y