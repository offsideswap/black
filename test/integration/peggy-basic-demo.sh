#!/usr/bin/env bash

## Case 1
## 1. send tx to cosmos after get the lock event in ethereum
blackfuryd tx ethbridge create-claim 0x30753E4A8aad7F8597332E813735Def5dD395028 3 eth 0x11111111262b236c9ac9a9a8c8e4276b5cf6b2c9 \
$(blackfuryd keys show akasha -a) $(blackfuryd keys show shadowfiend -a --bech val) 5 lock \
--token-contract-address=0x0000000000000000000000000000000000000000 --ethereum-chain-id=3 --from=shadowfiend --yes

# 2. query the tx
#blackfuryd q tx

# 3. check akasha account balance
blackfuryd q auth account $(blackfuryd keys show akasha -a)

# 4. query the prophecy
blackfuryd query ethbridge prophecy 0x30753E4A8aad7F8597332E813735Def5dD395028 3 eth 0x11111111262b236c9ac9a9a8c8e4276b5cf6b2c9 --ethereum-chain-id=3 --token-contract-address=0x0000000000000000000000000000000000000000

## Case 2
## 1. burn peggyetch for akasha
blackfuryd tx ethbridge burn $(blackfuryd keys show akasha -a) 0x11111111262b236c9ac9a9a8c8e4276b5cf6b2c9 \
1 ceth --ethereum-chain-id=3 --from=akasha --yes

## 2. query the tx
#blackfuryd q tx

## 3. check akasha account balance
blackfuryd q auth account $(blackfuryd keys show akasha -a)

## Case 3
## 1. lock akasha rwn in offsideswap
blackfuryd tx ethbridge lock $(blackfuryd keys show akasha -a) 0x11111111262b236c9ac9a9a8c8e4276b5cf6b2c9 \
10 rwn  --ethereum-chain-id=3 --from=akasha --yes

## 2. query the tx
#blackfuryd q tx

## 3. check akasha account balance
blackfuryd q auth account $(blackfuryd keys show akasha -a)

## Case 4
## 1. send tx to cosmos after peggyrwn burn in ethereum
blackfuryd tx ethbridge create-claim 0x30753E4A8aad7F8597332E813735Def5dD395028 1 rwn 0x11111111262b236c9ac9a9a8c8e4276b5cf6b2c9 \
$(blackfuryd keys show akasha -a) $(blackfuryd keys show shadowfiend -a --bech val) \
1 burn --ethereum-chain-id=3 --token-contract-address=0x345cA3e014Aaf5dcA488057592ee47305D9B3e10 --from=shadowfiend --yes

## 2. query the tx
#blackfuryd q tx

## 3. check akasha account balance
blackfuryd q auth account $(blackfuryd keys show akasha -a)