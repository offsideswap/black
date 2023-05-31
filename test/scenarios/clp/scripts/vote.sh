#!/bin/sh

# Vote yes to accept the proposal
blackfuryd tx gov vote 1 yes \
--from black --keyring-backend test \
--fees 100000fury \
--chain-id  localnet \
--broadcast-mode block \
-y