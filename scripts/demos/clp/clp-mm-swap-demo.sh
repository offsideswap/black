#!/usr/bin/env bash

echo "Creating pools ceth and cdash"
blackfuryd tx clp create-pool --from black --symbol ceth --nativeAmount 20000000000000000000 --externalAmount 20000000000000000000  --yes

sleep 5
blackfuryd tx clp create-pool --from black --symbol cdash --nativeAmount 20000000000000000000 --externalAmount 20000000000000000000  --yes


sleep 8
echo "Swap Native for Pegged - Sent fury Get ceth"
blackfuryd tx clp swap --from black --sentSymbol fury --receivedSymbol ceth --sentAmount 2000000000000000000 --minReceivingAmount 0 --yes
sleep 8
echo "Swap Pegged for Native - Sent ceth Get fury"
blackfuryd tx clp swap --from black --sentSymbol ceth --receivedSymbol fury --sentAmount 2000000000000000000 --minReceivingAmount 0 --yes
sleep 8
echo "Swap Pegged for Pegged - Sent ceth Get cdash"
blackfuryd tx clp swap --from black --sentSymbol ceth --receivedSymbol cdash --sentAmount 2000000000000000000 --minReceivingAmount 0 --yes

blackfuryd q clp pools

