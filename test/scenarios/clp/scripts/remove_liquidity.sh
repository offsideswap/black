#!/bin/sh

# Remove liquidity 
blackfuryd tx clp remove-liquidity \
--from black --keyring-backend test \
--fees 100000000000000000fury \
--symbol ceth \
--wBasis 5000 --asymmetry 0 \
--chain-id localnet \
--broadcast-mode block \
-y