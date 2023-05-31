#!/bin/sh
#
# Blackchain: IBC Relayer entrypoint.
#

TMPDIR=/tmp
REGISTRY_CONFIG="${TMPDIR}"/registry.yaml

#
# Generate a relayer registry file.
#
generate_registry() {
  cat <<EOF > ${REGISTRY_CONFIG}
version: 1

chains:
  ${CHAINNET0}:
    chain_id: ${CHAINNET0}
    prefix: ${PREFIX0}
    gas_price: '${GAS_PRICE0}'
    hd_path: m/44'/108'/0'/6'
    ics20_port: 'transfer'
    rpc:
      - http://${RPC0}

  ${CHAINNET1}:
    chain_id: ${CHAINNET1}
    prefix: ${PREFIX1}
    gas_price: '${GAS_PRICE1}'
    hd_path: m/44'/108'/0'/6'
    ics20_port: 'transfer'
    rpc:
      - http://${RPC1}
EOF
}

#
# Import Blackfury Mnemonic
#
import_mnemonic() {
  if [ "${BLACKFURY0_MNEMONIC}" == "${BLACKFURY1_MNEMONIC}" ]; then
    printf "%s\n\n" "${BLACKFURY0_MNEMONIC}" | blackfuryd keys add blackfury -i --recover --keyring-backend test
  else
    printf "%s\n\n" "${BLACKFURY0_MNEMONIC}" | blackfuryd keys add "${CHAINNET0}" -i --recover --keyring-backend test
    printf "%s\n\n" "${BLACKFURY1_MNEMONIC}" | blackfuryd keys add "${CHAINNET1}" -i --recover --keyring-backend test
  fi
}

#
# Get relayer addresses for each chain.
#
set_relayer_addrs() {
  RELAYER_CHAINNET0_ADDR=$(ibc-setup keys list | head -1 | awk -F: '{ print $2 }' | sed 's/^ *//g')
  RELAYER_CHAINNET1_ADDR=$(ibc-setup keys list | tail -1 | awk -F: '{ print $2 }' | sed 's/^ *//g')
}

#
# Transfer funds.
#
txfr_funds() {
  if [ "${BLACKFURY0_MNEMONIC}" == "${BLACKFURY1_MNEMONIC}" ]; then
    FROM_ADDR=$(blackfuryd keys show blackfury --keyring-backend test -a)
    blackfuryd tx bank send "${FROM_ADDR}" "${RELAYER_CHAINNET0_ADDR}" 100000000000000000000fury \
    --from blackfury \
    --gas-prices 0.5fury \
    --keyring-backend test \
    --node tcp://"${RPC0}" \
    --chain-id "${CHAINNET0}" -y

    blackfuryd tx bank send "${FROM_ADDR}" "${RELAYER_CHAINNET1_ADDR}" 100000000000000000000fury \
    --from blackfury \
    --gas-prices 0.5fury \
    --keyring-backend test \
    --node tcp://"${RPC1}" \
    --chain-id "${CHAINNET1}" -y
  else
    blackfuryd tx bank send $(blackfuryd keys show "${CHAINNET0}" --keyring-backend test -a) "${RELAYER_CHAINNET0_ADDR}" 100000000000000000000fury \
    --from "${CHAINNET0}" \
    --gas-prices 0.5fury \
    --keyring-backend test \
    --node tcp://"${RPC0}" \
    --chain-id "${CHAINNET0}" -y

    blackfuryd tx bank send $(blackfuryd keys show "${CHAINNET1}" --keyring-backend test -a) "${RELAYER_CHAINNET1_ADDR}" 100000000000000000000fury \
    --from "${CHAINNET1}" \
    --gas-prices 0.5fury \
    --keyring-backend test \
    --node tcp://"${RPC1}" \
    --chain-id "${CHAINNET1}" -y
  fi
}

#
# Configure the relayer.
#
setup() {
  generate_registry
  ibc-setup init --src "${CHAINNET0}" --dest "${CHAINNET1}" --registry-from "${TMPDIR}"
  import_mnemonic
  set_relayer_addrs
  txfr_funds
  ibc-setup ics20
}

#
# Run the relayer.
#
run() {
  ibc-relayer start -v --poll 10
}

echo "wait 30s for blackfurys to warm up" && sleep 30
setup
run
