#!/usr/bin/env bash


clibuilder()
{
   echo ""
   echo "Usage: $0 -u UpgradeName -c CurrentBinary -n NewBinary"
   echo -e "\t-u Name of the upgrade [Must match a handler defined in setup-handlers.go in NewBinary]"
   echo -e "\t-c Branch name for old binary (Upgrade From)"
   echo -e "\t-n Branch name for new binary (Upgrade To)"
   exit 1 # Exit script after printing help
}

while getopts "u:c:n:" opt
do
   case "$opt" in
      u ) UpgradeName="$OPTARG" ;;
      c ) CurrentBinary="$OPTARG" ;;
      n ) NewBinary="$OPTARG" ;;
      ? ) clibuilder ;; # Print cliBuilder in case parameter is non-existent
   esac
done

if [ -z "$UpgradeName" ] || [ -z "$CurrentBinary" ] || [ -z "$NewBinary" ]
then
   echo "Some or all of the parameters are empty";
   clibuilder
fi


export DAEMON_HOME=$HOME/.blackfuryd
export DAEMON_NAME=blackfuryd
export DAEMON_ALLOW_DOWNLOAD_BINARIES=true

make clean
rm -rf ~/.blackfuryd
rm -rf blackfury.log

rm -rf $GOPATH/bin/blackfuryd
rm -rf $GOPATH/bin/old/blackfuryd
rm -rf $GOPATH/bin/new/blackfuryd

# Setup old binary and start chain
git checkout $CurrentBinary
make install
cp $GOPATH/bin/blackfuryd $GOPATH/bin/old/
blackfuryd init test --chain-id=localnet -o

echo "Generating deterministic account - black"
echo "race draft rival universe maid cheese steel logic crowd fork comic easy truth drift tomorrow eye buddy head time cash swing swift midnight borrow" | blackfuryd keys add black --recover --keyring-backend=test

echo "Generating deterministic account - akasha"
echo "hand inmate canvas head lunar naive increase recycle dog ecology inhale december wide bubble hockey dice worth gravity ketchup feed balance parent secret orchard" | blackfuryd keys add akasha --recover --keyring-backend=test


#blackfuryd keys add mkey --multisig black,akasha --multisig-threshold 2 --keyring-backend=test

blackfuryd add-genesis-account $(blackfuryd keys show black -a --keyring-backend=test) 500000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink,90000000000000000000ibc/96D7172B711F7F925DFC7579C6CCC3C80B762187215ABD082CDE99F81153DC80 --keyring-backend=test
blackfuryd add-genesis-account $(blackfuryd keys show akasha -a --keyring-backend=test) 500000000000000000000000fury,500000000000000000000000catk,500000000000000000000000cbtk,500000000000000000000000ceth,990000000000000000000000000stake,500000000000000000000000cdash,500000000000000000000000clink --keyring-backend=test

#blackfuryd add-genesis-clp-admin $(blackfuryd keys show black -a --keyring-backend=test) --keyring-backend=test
#blackfuryd add-genesis-clp-admin $(blackfuryd keys show akasha -a --keyring-backend=test) --keyring-backend=test

#blackfuryd set-genesis-whitelister-admin black --keyring-backend=test

#blackfuryd add-genesis-validators $(blackfuryd keys show black -a --bech val --keyring-backend=test) --keyring-backend=test

blackfuryd gentx black 1000000000000000000000000stake --chain-id=localnet --keyring-backend=test

echo "Collecting genesis txs..."
blackfuryd collect-gentxs

echo "Validating genesis file..."
blackfuryd validate-genesis


mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
mkdir -p $DAEMON_HOME/cosmovisor/upgrades/$UpgradeName/bin


# Setup new binary
git checkout $NewBinary
rm -rf $GOPATH/bin/blackfuryd
make install
cp $GOPATH/bin/blackfuryd $GOPATH/bin/new/


# Setup cosmovisor
cp $GOPATH/bin/old/blackfuryd $DAEMON_HOME/cosmovisor/genesis/bin
cp $GOPATH/bin/new/blackfuryd $DAEMON_HOME/cosmovisor/upgrades/$UpgradeName/bin/

chmod +x $DAEMON_HOME/cosmovisor/genesis/bin/blackfuryd
chmod +x $DAEMON_HOME/cosmovisor/upgrades/$UpgradeName/bin/blackfuryd

contents="$(jq '.app_state.gov.voting_params.voting_period = "10s"' $DAEMON_HOME/config/genesis.json)" && \
echo "${contents}" > $DAEMON_HOME/config/genesis.json

# Add state data here if required

cosmovisor start --home ~/.blackfuryd/ --p2p.laddr 0.0.0.0:27655  --grpc.address 0.0.0.0:9096 --grpc-web.address 0.0.0.0:9093 --address tcp://0.0.0.0:27659 --rpc.laddr tcp://127.0.0.1:26657 >> blackfury.log 2>&1  &
#sleep 7
#blackfuryd tx tokenregistry register-all /Users/tanmay/Documents/blackfury/scripts/ibc/tokenregistration/localnet/fury.json --from black --keyring-backend=test --chain-id=localnet --yes
sleep 7
blackfuryd tx gov submit-proposal software-upgrade $UpgradeName --from black --deposit 100000000stake --upgrade-height 10 --title $UpgradeName --description $UpgradeName --keyring-backend test --chain-id localnet --yes
sleep 7
blackfuryd tx gov vote 1 yes --from black --keyring-backend test --chain-id localnet --yes
clear
sleep 7
blackfuryd query gov proposal 1

tail -f blackfury.log

#yes Y | blackfuryd tx gov submit-proposal software-upgrade 0.9.14 --from black --deposit 100000000stake --upgrade-height 30 --title 0.9.14 --description 0.9.14 --keyring-backend test --chain-id localnet