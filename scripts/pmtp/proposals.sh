#!/usr/bin/env bash

set -x

blackfuryd q gov proposals \
    --node ${BLACKFURY_NODE} \
    --chain-id $BLACKFURY_CHAIN_ID