#!/usr/bin/env bash

blackfuryd tx clp reward-period --path=./data/atom_rewards_fix.json \
	--from $ADMIN_KEY \
	--gas=500000 \
	--gas-prices=0.5fury \
	--chain-id $OFFSIDESWAP_ID \
	--node $BLACKFURY \
	--broadcast-mode block \
	--yes