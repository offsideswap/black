#!/bin/sh
. ./envs/$1.sh 

# sh ./register-one.sh testnet ixo


TOKEN_REGISTRY_ADMIN_ADDRESS="black1tpypxpppcf5lea47vcvgy09675nllmcucxydvu"

blackfuryd tx tokenregistry register ./$OFFSIDESWAP_ID/$2.json \
  --node $BLACK_NODE \
  --chain-id $OFFSIDESWAP_ID \
  --from $TOKEN_REGISTRY_ADMIN_ADDRESS \
  --keyring-backend $KEYRING_BACKEND \
  --gas=500000 \
  --gas-prices=0.5fury \
  -y