#!/usr/bin/env bash

set -x

blackfuryd tx bank send \
    $BLACK_ACT \
    black144w8cpva2xkly74xrms8djg69y3mljzplx3fjt \
    9299999999750930000fury \
    --keyring-backend test \
    --node ${BLACKFURY_NODE} \
    --chain-id $BLACKFURY_CHAIN_ID \
    --fees 100000000000000000fury \
    --broadcast-mode block \
    -y