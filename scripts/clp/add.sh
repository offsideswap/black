#!/bin/sh

set -x

blackfuryd tx clp add-liquidity \
  --externalAmount 488436982990 \
  --nativeAmount 96176925423929435353999282 \
  --symbol ceth \
  --from $BLACK_ACT \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y