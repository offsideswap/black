#!/usr/bin/env bash

set -x

blackfuryd tx clp pmtp-params \
  --pmtp_start=31 \
  --pmtp_end=1030 \
  --epochLength=100 \
  --rGov=0.10 \
  --from=$BLACK_ACT \
  --keyring-backend=test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id=$BLACKFURY_CHAIN_ID \
  --broadcast-mode=block \
  -y