#!/bin/sh

# sh ./deregister-all.sh testnet

. ./envs/$1.sh 

mkdir -p ./$BLACKCHAIN_ID
rm -f ./$BLACKCHAIN_ID/temp.json
rm -f ./$BLACKCHAIN_ID/temp2.json
rm -f ./$BLACKCHAIN_ID/tokenregistry.json

blackfuryd q tokenregistry add-all ./$BLACKCHAIN_ID/registry.json | jq > $BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/cosmos.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/akash.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/sentinel.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/iris.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/persistence.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/crypto-org.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/regen.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/terra.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/osmosis.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/juno.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/ixo.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/emoney.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/likecoin.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/bitsong.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/band.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/tokenregistry.json ./$BLACKCHAIN_ID/emoney-eeur.json | jq > $BLACKCHAIN_ID/temp.json
rm ./$BLACKCHAIN_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$BLACKCHAIN_ID/temp.json ./$BLACKCHAIN_ID/terra-uusd.json | jq > $BLACKCHAIN_ID/tokenregistry.json
rm ./$BLACKCHAIN_ID/temp.json