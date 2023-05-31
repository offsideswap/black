#!/bin/sh

# submit proposal to update clp params
blackfuryd tx gov submit-proposal param-change ./scripts/proposal.json \
--from black --keyring-backend test \
--fees 100000fury \
--chain-id localnet \
--broadcast-mode block \
-y