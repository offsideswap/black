#!/usr/bin/env bash

set -x

blackfuryd tx gov vote 1 yes \
    --from $BLACK_ACT \
    --keyring-backend test \
    --node ${BLACKFURY_NODE} \
    --chain-id $BLACKFURY_CHAIN_ID \
    --fees 100000000000000000fury \
    --broadcast-mode block \
    --trace \
    -y