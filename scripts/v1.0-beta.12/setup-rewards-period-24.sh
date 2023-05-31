#!/usr/bin/env bash

blackfuryd tx clp reward-period --path=./data/rp_24.json \
	--from $ADMIN_KEY \
	--gas=500000 \
	--gas-prices=0.5fury \
	--chain-id $BLACKCHAIN_ID \
	--node $BLACKFURY \
	--broadcast-mode block \
	--yes