#!/usr/bin/env bash

blackfuryd tx clp set-lppd-params --path=./data/lpd_params.json \
	--from $ADMIN_KEY \
	--gas=500000 \
	--gas-prices=0.5fury \
	--chain-id $OFFSIDESWAP_ID \
	--node $BLACKFURY \
	--broadcast-mode block \
	--yes