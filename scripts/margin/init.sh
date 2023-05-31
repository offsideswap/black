#!/usr/bin/env bash

### chain init script for development purposes only ###

cd ../..
make clean install
rm -rf ~/.blackfuryd
blackfuryd init test --chain-id=localnet -o

echo "Generating deterministic account - black"
echo "race draft rival universe maid cheese steel logic crowd fork comic easy truth drift tomorrow eye buddy head time cash swing swift midnight borrow" | blackfuryd keys add black --recover --keyring-backend=test

echo "Generating deterministic account - akasha"
echo "hand inmate canvas head lunar naive increase recycle dog ecology inhale december wide bubble hockey dice worth gravity ketchup feed balance parent secret orchard" | blackfuryd keys add akasha --recover --keyring-backend=test


blackfuryd keys add mkey --multisig black,akasha --multisig-threshold 2 --keyring-backend=test

blackfuryd add-genesis-account $(blackfuryd keys show black -a --keyring-backend=test) "999000000000000000000000000000000fury,999000000000000000000000000000000stake,999000000000000000000000000000000cusdc,999000000000000000000000000000000ceth,999000000000000000000000000000000cwbtc,999000000000000000000000000000000ibc/27394FB092D2ECCD56123C74F36E4C1F926001CEADA9CA97EA622B25F41E5EB2" --keyring-backend=test
blackfuryd add-genesis-account $(blackfuryd keys show akasha -a --keyring-backend=test) 500000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink --keyring-backend=test

blackfuryd add-genesis-clp-admin $(blackfuryd keys show black -a --keyring-backend=test) --keyring-backend=test
blackfuryd add-genesis-clp-admin $(blackfuryd keys show akasha -a --keyring-backend=test) --keyring-backend=test

blackfuryd set-genesis-oracle-admin black --keyring-backend=test
blackfuryd add-genesis-validators $(blackfuryd keys show black -a --bech val --keyring-backend=test) --keyring-backend=test

blackfuryd set-genesis-whitelister-admin black --keyring-backend=test
# blackfuryd set-gen-denom-whitelist scripts/denoms.json

blackfuryd gentx black 1000000000000000000000000stake --chain-id=localnet --keyring-backend=test

echo "Collecting genesis txs..."
blackfuryd collect-gentxs

echo "Validating genesis file..."
blackfuryd validate-genesis
