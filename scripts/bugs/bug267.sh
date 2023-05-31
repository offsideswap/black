#!/usr/bin/env bash


rm -rf ~/.blackfuryd
rm -rf blackfury.log
rm -rf testlog.log

cd "$(dirname "$0")"

./init.sh
sleep 8
blackfuryd start >> blackfury.log 2>&1  &
sleep 8

yes Y | blackfuryd tx clp create-pool --from akasha --symbol catk --nativeAmount 1000 --externalAmount 1000
sleep 8
yes Y | blackfuryd tx clp create-pool --from akasha --symbol cbtk --nativeAmount 1000 --externalAmount 1000


echo "Query specific pool"
sleep 8
blackfuryd query clp pool catk

echo "adding new liquidity provider"
sleep 8
yes Y | blackfuryd tx clp add-liquidity --from black --symbol catk --nativeAmount 5000000000000000000000 --externalAmount 5000000000000000000

echo "Query 1st Liquidity Provider / Pool creator is the first lp for the pool"
sleep 8
blackfuryd query clp lp catk $(blackfuryd keys show akasha -a)

echo "Query 2nd Liquidity Provider "
sleep 8
blackfuryd query clp lp catk $(blackfuryd keys show black -a)


pkill blackfuryd
