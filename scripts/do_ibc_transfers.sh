#!/bin/zsh

# save balances to examine later
BLACK_BEFORE_TRANSFERS=$(echo "localnet-1"; blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27665; echo ""; echo "localnet-2"; blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27666; echo ""; echo "localnet-3";  blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27667)

AKASHA_BEFORE_TRANSFERS=$(echo "localnet-1"; blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27665; echo ""; echo "localnet-2"; blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27666; echo ""; echo "localnet-3"; blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27667)


blackfuryd tx ibc-transfer transfer transfer channel-1 $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) 50000000000000000000fury --node tcp://127.0.0.1:27666 --chain-id=localnet-2 --from=akasha --log_level=debug  --keyring-backend test --gas-prices 10000000000000000fury  --home ~/.blackfury-2 --yes --broadcast-mode block
echo "Tried localnet-2 -> localnet-3"
echo ""

sleep 5

blackfuryd tx ibc-transfer transfer transfer channel-0 $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) 50000000000000000000fury --node tcp://127.0.0.1:27666 --chain-id=localnet-2 --from=akasha --log_level=debug  --keyring-backend test --gas-prices 10000000000000000fury  --home ~/.blackfury-2 --yes --broadcast-mode block
echo "Tried localnet-2 -> localnet-1"
echo ""

sleep 5

blackfuryd tx ibc-transfer transfer transfer channel-0 $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) 50000000000000000000fury --node tcp://127.0.0.1:27665 --chain-id=localnet-1 --from=akasha --log_level=debug  --keyring-backend test --gas-prices 10000000000000000fury  --home ~/.blackfury-1 --yes --broadcast-mode block
echo "Tried localnet-1 -> localnet-2"
echo ""

sleep 5

blackfuryd tx ibc-transfer transfer transfer channel-1 $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) 50000000000000000000fury --node tcp://127.0.0.1:27667 --chain-id=localnet-3 --from=akasha --log_level=debug  --keyring-backend test --gas-prices 10000000000000000fury  --home ~/.blackfury-3 --yes --broadcast-mode block
echo "Tried localnet-3 -> localnet-1"
echo ""

sleep 5

blackfuryd tx ibc-transfer transfer transfer channel-1 $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) 50000000000000000000fury --node tcp://127.0.0.1:27665 --chain-id=localnet-1 --from=akasha --log_level=debug  --keyring-backend test --gas-prices 10000000000000000fury  --home ~/.blackfury-1 --yes --broadcast-mode block
echo "Tried localnet-1 -> localnet-3"

sleep 10

echo "Checking channels"
hermes query packet unreceived-packets localnet-1 transfer channel-0
hermes query packet unreceived-packets localnet-1 transfer channel-1
hermes query packet unreceived-packets localnet-2 transfer channel-0
hermes query packet unreceived-packets localnet-2 transfer channel-1
hermes query packet unreceived-packets localnet-3 transfer channel-0
hermes query packet unreceived-packets localnet-3 transfer channel-1

echo "Black balances before transfers"
echo $BLACK_BEFORE_TRANSFERS

echo "Current Black balances (should go up for fury)"
echo "localnet-1"
blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27665
echo ""
echo "localnet-2"
blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27666
echo ""
echo "localnet-3"
blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27667
echo ""

echo "Akasha balances before transfers"
echo $AKASHA_BEFORE_TRANSFERS

echo "Current Akaha balances (should go down for fury)"
echo "localnet-1"
blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27665
echo ""
echo "localnet-2"
blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27666
echo ""
echo "localnet-3"
blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test --home ~/.blackfury-1) --node tcp://127.0.0.1:27667
