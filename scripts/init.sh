#!/usr/bin/env bash

### chain init script for development purposes only ###

make clean install
rm -rf ~/.blackfuryd
blackfuryd init test --chain-id=localnet -o

echo "Generating deterministic account - black"
echo "race draft rival universe maid cheese steel logic crowd fork comic easy truth drift tomorrow eye buddy head time cash swing swift midnight borrow" | blackfuryd keys add black --recover --keyring-backend=test

echo "Generating deterministic account - akasha"
echo "hand inmate canvas head lunar naive increase recycle dog ecology inhale december wide bubble hockey dice worth gravity ketchup feed balance parent secret orchard" | blackfuryd keys add akasha --recover --keyring-backend=test

echo "Generating deterministic account - alice"
echo "crunch enable gauge equip sadness venture volcano capable boil pole lounge because service level giggle decide south deposit bike antique consider olympic girl butter" | blackfuryd keys add alice --recover --keyring-backend=test

blackfuryd keys add mkey --multisig black,akasha --multisig-threshold 2 --keyring-backend=test

blackfuryd add-genesis-account $(blackfuryd keys show black -a --keyring-backend=test) 500000000000000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink,5000000000000cusdt,90000000000000000000ibc/96D7172B711F7F925DFC7579C6CCC3C80B762187215ABD082CDE99F81153DC80 --keyring-backend=test
blackfuryd add-genesis-account $(blackfuryd keys show akasha -a --keyring-backend=test) 500000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink --keyring-backend=test
blackfuryd add-genesis-account $(blackfuryd keys show alice -a --keyring-backend=test) 500000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink --keyring-backend=test

blackfuryd add-genesis-clp-admin $(blackfuryd keys show black -a --keyring-backend=test) --keyring-backend=test
blackfuryd add-genesis-clp-admin $(blackfuryd keys show akasha -a --keyring-backend=test) --keyring-backend=test

blackfuryd set-genesis-oracle-admin black --keyring-backend=test
blackfuryd add-genesis-validators $(blackfuryd keys show black -a --bech val --keyring-backend=test) --keyring-backend=test

blackfuryd set-genesis-whitelister-admin black --keyring-backend=test
blackfuryd set-gen-denom-whitelist scripts/denoms.json

blackfuryd gentx black 1000000000000000000000000stake --moniker black_val --chain-id=localnet --keyring-backend=test

echo "Collecting genesis txs..."
blackfuryd collect-gentxs

echo "Validating genesis file..."
blackfuryd validate-genesis
