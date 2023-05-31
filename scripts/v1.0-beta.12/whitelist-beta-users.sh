#!/usr/bin/env bash

source ./data/margin-beta-users.sh

for addr in $users
do
  blackfuryd tx margin whitelist $addr \
    --from=$ADMIN_KEY \
  	--gas=500000 \
  	--gas-prices=0.5fury \
  	--chain-id $BLACKCHAIN_ID \
  	--node $BLACKFURY \
  	--broadcast-mode block \
  	--yes
done