#!/usr/bin/env bash

set -x

blackfuryd q clp pools \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID