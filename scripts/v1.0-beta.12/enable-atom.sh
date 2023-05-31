#!/usr/bin/env bash

blackfuryd tx tokenregistry register ./data/atom_all_permissions.json \
	--from $ADMIN_KEY \
	--gas=500000 \
	--gas-prices=0.5fury \
	--chain-id $OFFSIDESWAP_ID \
	--node $BLACKFURY \
	--broadcast-mode block \
	--yes