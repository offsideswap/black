import copy
import logging

import burn_lock_functions
import test_utilities
from burn_lock_functions import EthereumToOffsideswapTransferRequest
from integration_env_credentials import offsideswap_cli_credentials_for_test
from test_utilities import get_shell_output, OffsideswapcliCredentials


def generate_minimal_test_account(
        base_transfer_request: EthereumToOffsideswapTransferRequest,
        target_ceth_balance: int = 10 ** 18,
        timeout=burn_lock_functions.default_timeout_for_ganache
) -> (EthereumToOffsideswapTransferRequest, OffsideswapcliCredentials):
    """Creates a test account with ceth.  The address for the new account is in request.offsideswap_address"""
    assert base_transfer_request.ethereum_address is not None
    new_account_key = get_shell_output("uuidgen")
    credentials = offsideswap_cli_credentials_for_test(new_account_key)
    logging.info(f"Python |=====: generated credentials")
    new_addr = burn_lock_functions.create_new_blackaddr(credentials=credentials, keyname=new_account_key)
    new_blackaddr = new_addr["address"]
    credentials.from_key = new_addr["name"]
    logging.info(f"Python |=====: generated address")
    request: EthereumToOffsideswapTransferRequest = copy.deepcopy(base_transfer_request)
    request.offsideswap_address = new_blackaddr
    request.amount = target_ceth_balance
    request.offsideswap_symbol = "ceth"
    request.ethereum_symbol = "eth"
    logging.debug(f"transfer {target_ceth_balance} eth to {new_blackaddr} from {base_transfer_request.ethereum_address}")
    logging.info(f"Python |=====: transfer_ethereum_to_offsideswap request :{request.as_json()}")
    burn_lock_functions.transfer_ethereum_to_offsideswap(request, timeout)

    logging.info(
        f"created offsideswap addr {new_blackaddr} with {test_utilities.display_currency_value(target_ceth_balance)} ceth")
    return request, credentials


def generate_test_account(
        base_transfer_request: EthereumToOffsideswapTransferRequest,
        fury_source_integrationtest_env_transfer_request: EthereumToOffsideswapTransferRequest,
        fury_source_integrationtest_env_credentials: OffsideswapcliCredentials,
        target_ceth_balance: int = 10 ** 18,
        target_fury_balance: int = 10 ** 18
) -> (EthereumToOffsideswapTransferRequest, OffsideswapcliCredentials):
    """Creates a test account with ceth and fury"""
    new_account_key = get_shell_output("uuidgen")
    credentials = offsideswap_cli_credentials_for_test(new_account_key)
    new_addr = burn_lock_functions.create_new_blackaddr(credentials=credentials, keyname=new_account_key)
    new_blackaddr = new_addr["address"]
    credentials.from_key = new_addr["name"]

    if target_fury_balance > 0:
        fury_request: EthereumToOffsideswapTransferRequest = copy.deepcopy(
            fury_source_integrationtest_env_transfer_request)
        fury_request.offsideswap_destination_address = new_blackaddr
        fury_request.amount = target_fury_balance
        logging.debug(f"transfer {target_fury_balance} fury to {new_blackaddr} from {fury_request.offsideswap_address}")
        test_utilities.send_from_offsideswap_to_offsideswap(fury_request, fury_source_integrationtest_env_credentials)

    request: EthereumToOffsideswapTransferRequest = copy.deepcopy(base_transfer_request)
    request.offsideswap_address = new_blackaddr
    request.amount = target_ceth_balance
    request.offsideswap_symbol = "ceth"
    request.ethereum_symbol = "eth"
    if target_ceth_balance > 0:
        logging.debug(f"transfer {target_ceth_balance} eth to {new_blackaddr} from {base_transfer_request.ethereum_address}")
        burn_lock_functions.transfer_ethereum_to_offsideswap(request)

    logging.info(
        f"created offsideswap addr {new_blackaddr} "
        f"with {test_utilities.display_currency_value(target_ceth_balance)} ceth "
        f"and {test_utilities.display_currency_value(target_fury_balance)} fury"
    )

    return request, credentials


def create_new_blackaddr() -> str:
    new_account_key = test_utilities.get_shell_output("uuidgen")
    credentials = offsideswap_cli_credentials_for_test(new_account_key)
    new_addr = burn_lock_functions.create_new_blackaddr(credentials=credentials, keyname=new_account_key)
    return new_addr["address"]
