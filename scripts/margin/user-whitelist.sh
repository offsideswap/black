#!/usr/bin/env bash

set -x

blackfuryd tx margin whitelist $(blackfuryd keys show tester1 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester2 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester3 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester4 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester5 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester6 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester7 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester8 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester9 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester10 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
blackfuryd tx margin whitelist $(blackfuryd keys show tester11 --keyring-backend=test -a) \
  --from $ADMIN_KEY \
  --keyring-backend test \
  --fees 100000000000000000fury \
  --node ${BLACKFURY_NODE} \
  --chain-id $BLACKFURY_CHAIN_ID \
  --broadcast-mode block \
  -y
