#!/usr/bin/env bash

# Use blackfuryd q account $(blackfuryd keys show black -a) to get seq
seq=1
blackfuryd tx dispensation create Airdrop output.json --gas 90128 --from $(blackfuryd keys show black -a) --yes --broadcast-mode async --sequence $seq --account-number 3 --chain-id localnet
seq=$((seq+1))
blackfuryd tx dispensation create ValidatorSubsidy output.json --gas 90128 --from $(blackfuryd keys show black -a) --yes --broadcast-mode async --sequence $seq --account-number 3 --chain-id localnet
seq=$((seq+1))
blackfuryd tx dispensation create ValidatorSubsidy output.json --gas 90128 --from $(blackfuryd keys show black -a) --yes --broadcast-mode async --sequence $seq --account-number 3 --chain-id localnet