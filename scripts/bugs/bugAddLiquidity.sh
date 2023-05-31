#!/usr/bin/env bash

#Sample script to test the issue mentioned in
#https://app.asana.com/0/1199697235740010/1199903639901927/f

rm -rf ~/.blackfuryd
rm -rf blackfury.log
rm -rf testlog.log

cd "$(dirname "$0")"

./init.sh
sleep 5
blackfuryd start >> blackfury.log 2>&1  &
sleep 5

yes Y | blackfuryd tx clp create-pool --from black --symbol cacoin --nativeAmount 162057826929020210025062784 --externalAmount 1000000000000000000000 --fees 1300000fury
sleep 5

blackfuryd q clp pools

echo "adding new liquidity provider"
sleep 5
yes Y | blackfuryd tx clp add-liquidity --from akasha --symbol cacoin --nativeAmount 1000000000000000000000 --externalAmount 8999998679900000000000000000000 --fees 1300000fury
