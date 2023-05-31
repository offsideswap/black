#!/usr/bin/env bash

blackfuryd tx margin update-pools ./data/temp_pools.json \
	--closed-pools ./data/closed_pools.json \
  --from=$ADMIN_KEY \
	--gas=500000 \
	--gas-prices=0.5fury \
	--chain-id $OFFSIDESWAP_ID \
	--node $BLACKFURY \
	--broadcast-mode block \
	--yes

blackfuryd tx margin whitelist black1mwmrarhynjuau437d07p42803rntfxqjun3pfu \
  --from=$ADMIN_KEY \
	--gas=500000 \
	--gas-prices=0.5fury \
	--chain-id $OFFSIDESWAP_ID \
	--node $BLACKFURY \
	--broadcast-mode block \
	--yes