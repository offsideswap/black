#!/usr/bin/env bash

set -x

blackfuryd tx clp create-pool \
  --from $BLACK_ACT \
  --keyring-backend test \
  --symbol cusdt \
  --nativeAmount 1550459183129248235861408 \
  --externalAmount 174248776094 \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y