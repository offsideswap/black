#!/bin/sh

# sh ./deregister-all.sh testnet

. ./envs/$1.sh 

TOKEN_REGISTRY_ADMIN_ADDRESS="black1tpypxpppcf5lea47vcvgy09675nllmcucxydvu"

blackfuryd tx tokenregistry deregister-all ./$BLACKCHAIN_ID/tokenregistry.json \
  --node $BLACK_NODE \
  --chain-id $BLACKCHAIN_ID \
  --from $TOKEN_REGISTRY_ADMIN_ADDRESS \
  --keyring-backend $KEYRING_BACKEND \
  --gas=500000 \
  --gas-prices=0.5fury \
  -y