#!/usr/bin/env bash

set -x

blackfuryd q bank balances $ADMIN_ADDRESS \
    --node ${BLACKFURY_NODE} \
    --chain-id $BLACKFURY_CHAIN_ID