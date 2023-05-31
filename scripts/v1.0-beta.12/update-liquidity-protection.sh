#!/usr/bin/env bash

blackfuryd tx clp liquidity-protection-params --isActive=true \
	--maxFuryLiquidityThreshold=43815115800 \
  --maxFuryLiquidityThresholdAsset=cusdc \
  --epochLength=14400 \
	--from $ADMIN_KEY \
	--gas=500000 \
	--gas-prices=0.5fury \
	--chain-id $OFFSIDESWAP_ID \
	--node $BLACKFURY \
	--broadcast-mode block \
	--yes