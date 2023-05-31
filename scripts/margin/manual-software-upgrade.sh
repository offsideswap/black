#!/usr/bin/env bash

set -x

blackfuryd tx gov submit-proposal software-upgrade "${NEW_VERSION}" \
  --from ${BLACK_ACT} \
  --deposit "${DEPOSIT}" \
  --upgrade-height "${TARGET_BLOCK}" \
  --title "v${NEW_VERSION}" \
  --description "v${NEW_VERSION}" \
  --chain-id "${BLACKFURY_CHAIN_ID}" \
  --node "${BLACKFURY_NODE}" \
  --keyring-backend "test" \
  --fees 100000000000000000fury \
  --broadcast-mode=block \
  -y