#!/usr/bin/env bash

### chain init script for development purposes only ###

make clean install
blackfuryd init test --chain-id=localnet

echo "Generating deterministic account - black"
echo "race draft rival universe maid cheese steel logic crowd fork comic easy truth drift tomorrow eye buddy head time cash swing swift midnight borrow" | blackfuryd keys add black --recover

echo "Generating deterministic account - akasha"
echo "hand inmate canvas head lunar naive increase recycle dog ecology inhale december wide bubble hockey dice worth gravity ketchup feed balance parent secret orchard" | blackfuryd keys add akasha --recover

blackfuryd add-genesis-account $(blackfuryd keys show black -a) 16205782692902021002506278400fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink,899999867990000000000000000000cacoin
blackfuryd add-genesis-account $(blackfuryd keys show akasha -a) 5000000000000003407464fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink,8999998679900000000000000000000cacoin

blackfuryd add-genesis-clp-admin $(blackfuryd keys show black -a)
blackfuryd add-genesis-clp-admin $(blackfuryd keys show akasha -a)

blackfuryd  add-genesis-validators $(blackfuryd keys show black -a --bech val)

blackfuryd gentx black 1000000000000000000000000stake --keyring-backend test

echo "Collecting genesis txs..."
blackfuryd collect-gentxs

echo "Validating genesis file..."
blackfuryd validate-genesis
