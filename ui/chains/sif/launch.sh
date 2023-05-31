#!/usr/bin/env bash

. ../credentials.sh

rm -rf ~/.blackfuryd

blackfuryd init test --chain-id=blackchain-local
cp ./app.toml ~/.blackfuryd/config

echo "Generating deterministic account - ${SHADOWFIEND_NAME}"
echo "${SHADOWFIEND_MNEMONIC}" | blackfuryd keys add ${SHADOWFIEND_NAME}  --keyring-backend=test --recover

echo "Generating deterministic account - ${AKASHA_NAME}"
echo "${AKASHA_MNEMONIC}" | blackfuryd keys add ${AKASHA_NAME}  --keyring-backend=test --recover

echo "Generating deterministic account - ${JUNIPER_NAME}"
echo "${JUNIPER_MNEMONIC}" | blackfuryd keys add ${JUNIPER_NAME} --keyring-backend=test --recover

blackfuryd add-genesis-account $(blackfuryd keys show ${SHADOWFIEND_NAME} -a --keyring-backend=test) 100000000000000000000000000000fury,100000000000000000000000000000catk,100000000000000000000000000000cbtk,100000000000000000000000000000ceth,100000000000000000000000000000cusdc,100000000000000000000000000000clink,100000000000000000000000000stake
blackfuryd add-genesis-account $(blackfuryd keys show ${AKASHA_NAME} -a --keyring-backend=test) 100000000000000000000000000000fury,100000000000000000000000000000catk,100000000000000000000000000000cbtk,100000000000000000000000000000ceth,100000000000000000000000000000cusdc,100000000000000000000000000000clink,100000000000000000000000000stake
blackfuryd add-genesis-account $(blackfuryd keys show ${JUNIPER_NAME} -a --keyring-backend=test) 10000000000000000000000fury,10000000000000000000000cusdc,100000000000000000000clink,100000000000000000000ceth

blackfuryd add-genesis-validators $(blackfuryd keys show ${SHADOWFIEND_NAME} -a --bech val --keyring-backend=test)

blackfuryd gentx ${SHADOWFIEND_NAME} 1000000000000000000000000stake --chain-id=blackchain-local --keyring-backend test

echo "Collecting genesis txs..."
blackfuryd collect-gentxs

echo "Validating genesis file..."
blackfuryd validate-genesis

echo "Starting test chain"

./start.sh
