#!/usr/bin/env bash

### chain init script for development purposes only ###

make clean install
blackfuryd init test --chain-id=localnet

echo "Generating deterministic account - black"
echo "race draft rival universe maid cheese steel logic crowd fork comic easy truth drift tomorrow eye buddy head time cash swing swift midnight borrow" | blackfuryd keys add black --recover

echo "Generating deterministic account - akasha"
echo "hand inmate canvas head lunar naive increase recycle dog ecology inhale december wide bubble hockey dice worth gravity ketchup feed balance parent secret orchard" | blackfuryd keys add akasha --recover


blackfuryd keys add mkey --multisig black,akasha --multisig-threshold 2
blackfuryd add-genesis-account $(blackfuryd keys show black -a) 500000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink
blackfuryd add-genesis-account $(blackfuryd keys show akasha -a) 500000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink
blackfuryd add-genesis-account $(blackfuryd keys show mkey -a) 500000000000000000000000fury

blackfuryd add-genesis-clp-admin $(blackfuryd keys show black -a)
blackfuryd add-genesis-clp-admin $(blackfuryd keys show akasha -a)

blackfuryd add-genesis-validators $(blackfuryd keys show black -a --bech val)

blackfuryd gentx black 1000000000000000000000000stake --keyring-backend test

echo "Collecting genesis txs..."
blackfuryd collect-gentxs

echo "Validating genesis file..."
blackfuryd validate-genesis


mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
mkdir -p $DAEMON_HOME/cosmovisor/upgrades/release-20210414000000/bin

cp $GOPATH/bin/old/blackfuryd $DAEMON_HOME/cosmovisor/genesis/bin
cp $GOPATH/bin/blackfuryd $DAEMON_HOME/cosmovisor/upgrades/release-20210414000000/bin/

#contents="$(jq '.gov.voting_params.voting_period = 10' $DAEMON_HOME/config/genesis.json)" && \
#echo "${contents}" > $DAEMON_HOME/config/genesis.json
