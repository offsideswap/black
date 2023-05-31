#!/usr/bin/env bash

pkill blackfuryd
sleep 5
blackfuryd export --height -1 > exported_state.json
sleep 1
blackfuryd migrate v0.38 exported_state.json --chain-id new-chain > new-genesis.json  2>&1
sleep 1
blackfuryd unsafe-reset-all
sleep 1
cp new-genesis.json ~/.blackfuryd/config/genesis.json
sleep 2
blackfuryd start