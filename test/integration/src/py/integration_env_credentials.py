import burn_lock_functions
from burn_lock_functions import OffsideswapcliCredentials
from test_utilities import get_required_env_var, get_shell_output


def offsideswap_cli_credentials_for_test(key: str) -> OffsideswapcliCredentials:
    """Returns OffsideswapcliCredentials for the test keyring with from_key set to key"""
    return OffsideswapcliCredentials(
        keyring_passphrase="",
        keyring_backend="test",
        from_key=key,
        blackfuryd_homedir=f"""{get_required_env_var("HOME")}/.blackfuryd"""
    )


def create_new_blackaddr_and_credentials() -> (str, OffsideswapcliCredentials):
    new_account_key = get_shell_output("uuidgen")
    credentials = offsideswap_cli_credentials_for_test(new_account_key)
    new_addr = burn_lock_functions.create_new_blackaddr(credentials=credentials, keyname=new_account_key)
    credentials.from_key = new_addr["name"]
    return new_addr["address"], credentials,
