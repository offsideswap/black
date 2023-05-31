#!/bin/sh

# sh ./deregister-all.sh testnet

. ./envs/$1.sh 

mkdir -p ./$OFFSIDESWAP_ID
rm -f ./$OFFSIDESWAP_ID/temp.json
rm -f ./$OFFSIDESWAP_ID/temp2.json
rm -f ./$OFFSIDESWAP_ID/tokenregistry.json

blackfuryd q tokenregistry add-all ./$OFFSIDESWAP_ID/registry.json | jq > $OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/cosmos.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/akash.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/sentinel.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/iris.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/persistence.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/crypto-org.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/regen.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/terra.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/osmosis.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/juno.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/ixo.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/emoney.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/likecoin.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/bitsong.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/band.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/tokenregistry.json ./$OFFSIDESWAP_ID/emoney-eeur.json | jq > $OFFSIDESWAP_ID/temp.json
rm ./$OFFSIDESWAP_ID/tokenregistry.json
blackfuryd q tokenregistry add ./$OFFSIDESWAP_ID/temp.json ./$OFFSIDESWAP_ID/terra-uusd.json | jq > $OFFSIDESWAP_ID/tokenregistry.json
rm ./$OFFSIDESWAP_ID/temp.json