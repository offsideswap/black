#!/usr/bin/env bash

set -x

echo ${ADMIN_MNEMONIC} | blackfuryd keys add ${BLACK_ACT} --recover --keyring-backend=test