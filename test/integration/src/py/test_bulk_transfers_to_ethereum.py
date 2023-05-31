import copy
import logging

import pytest

import burn_lock_functions
import test_utilities
from integration_env_credentials import blackchain_cli_credentials_for_test
from test_utilities import EthereumToBlackchainTransferRequest, BlackchaincliCredentials


def create_new_blackaddr():
    new_account_key = test_utilities.get_shell_output("uuidgen")
    credentials = blackchain_cli_credentials_for_test(new_account_key)
    new_addr = burn_lock_functions.create_new_blackaddr(credentials=credentials, keyname=new_account_key)
    return new_addr["address"]


def create_new_blackaddr_and_key():
    new_account_key = test_utilities.get_shell_output("uuidgen")
    credentials = blackchain_cli_credentials_for_test(new_account_key)
    new_addr = burn_lock_functions.create_new_blackaddr(credentials=credentials, keyname=new_account_key)
    return new_addr["address"], new_addr["name"]


@pytest.mark.skipif(
    not test_utilities.get_optional_env_var("NTRANSFERS", None),
    reason="run by hand and specify NTRANSFERS"
)
def test_bulk_transfers_from_blackchain(
        basic_transfer_request: EthereumToBlackchainTransferRequest,
        fury_source_integrationtest_env_credentials: BlackchaincliCredentials,
        fury_source_integrationtest_env_transfer_request: EthereumToBlackchainTransferRequest,
        smart_contracts_dir,
        source_ethereum_address,
        fury_source,
        fury_source_key,
        bridgebank_address,
        bridgetoken_address,
        ethereum_network,
        blackchain_fees_int,
):
    test_transfer_amount = 100  # just a tiny number of wei to move to confirm things are working
    tokens = test_utilities.get_required_env_var("TOKENS", "ceth,fury").split(",")
    logging.info(f"tokens to be transferred are: {tokens}")
    logging.info("create new ethereum and blackchain addresses")
    basic_transfer_request.ethereum_address = source_ethereum_address
    n_transfers = int(test_utilities.get_optional_env_var("NTRANSFERS", 2))
    n_transactions = n_transfers * len(tokens)
    new_addresses_and_keys = list(map(lambda x: create_new_blackaddr_and_key(), range(n_transactions)))
    logging.debug(f"new_addresses_and_keys: {new_addresses_and_keys}")
    credentials_for_account_with_ceth = BlackchaincliCredentials(from_key=fury_source_key)
    request: EthereumToBlackchainTransferRequest = copy.deepcopy(basic_transfer_request)
    ceth_amount = n_transactions * (test_utilities.highest_gas_cost + 100)
    request.amount = ceth_amount
    request.ethereum_address = source_ethereum_address
    request.blackchain_address = fury_source
    addresses_to_populate = copy.deepcopy(new_addresses_and_keys)
    test_transfers = []
    for a in range(n_transfers):
        for t in tokens:
            request.blackchain_destination_address, from_key = addresses_to_populate.pop()

            # send ceth to pay for the burn
            request.amount = test_utilities.burn_gas_cost
            request.blackchain_symbol = "ceth"
            burn_lock_functions.transfer_blackchain_to_blackchain(request, credentials_for_account_with_ceth)

            # send fury to pay the fee
            request.amount = blackchain_fees_int
            request.blackchain_symbol = "fury"
            burn_lock_functions.transfer_blackchain_to_blackchain(request, credentials_for_account_with_ceth)

            # send the token itself
            request.amount = test_transfer_amount
            request.blackchain_symbol = t
            burn_lock_functions.transfer_blackchain_to_blackchain(request, credentials_for_account_with_ceth)
            transfer = (request.blackchain_destination_address, from_key, request.blackchain_symbol, request.amount)

            test_utilities.get_blackchain_addr_balance(request.blackchain_destination_address, request.blackfuryd_node, t)

            test_transfers.append(transfer)

    logging.debug(f"test_transfers is {test_transfers}")

    text_file = open("pfile.cmds", "w")
    simple_credentials = BlackchaincliCredentials(
        keyring_passphrase=None,
        keyring_backend="test",
        from_key=None,
        blackfuryd_homedir=None
    )

    logging.info(f"all accounts are on blackchain and have the correct balance")

    new_eth_addrs = test_utilities.create_ethereum_addresses(
        smart_contracts_dir,
        basic_transfer_request.ethereum_network,
        n_transactions
    )
    logging.debug(f"new eth addrs: {new_eth_addrs}")

    ethereum_transfers = []
    for blackaddr, from_key, blacksymbol, amount in test_transfers:
        destination_ethereum_address_element = new_eth_addrs.pop()
        r = copy.deepcopy(basic_transfer_request)
        r.blackchain_symbol = blacksymbol
        r.blackchain_address = blackaddr
        r.ethereum_address = destination_ethereum_address_element["address"]
        r.amount = amount
        simple_credentials.from_key = from_key
        c = test_utilities.send_from_blackchain_to_ethereum_cmd(r, simple_credentials)
        ethereum_symbol = test_utilities.blackchain_symbol_to_ethereum_symbol(blacksymbol)
        transfer = (r.ethereum_address, ethereum_symbol, amount)
        ethereum_transfers.append(transfer)
        text_file.write(f"{c}\n")
    text_file.close()
    test_utilities.get_shell_output("cat pfile.cmds | parallel --trim lr -v {}")
    whitelist = test_utilities.get_whitelisted_tokens(basic_transfer_request)
    test_utilities.advance_n_ethereum_blocks(test_utilities.n_wait_blocks, smart_contracts_dir)
    for ethereum_address, ethereum_symbol, amount in ethereum_transfers:
        r = copy.deepcopy(basic_transfer_request)
        r.ethereum_address = ethereum_address
        r.ethereum_symbol = test_utilities.get_token_ethereum_address(
            ethereum_symbol,
            whitelist
        )
        r.amount = amount
        test_utilities.wait_for_eth_balance(
            transfer_request=r,
            target_balance=amount,
            max_seconds=60 * 60 * 10
        )
