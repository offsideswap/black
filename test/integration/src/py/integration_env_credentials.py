import burn_lock_functions
from burn_lock_functions import BlackchaincliCredentials
from test_utilities import get_required_env_var, get_shell_output


def blackchain_cli_credentials_for_test(key: str) -> BlackchaincliCredentials:
    """Returns BlackchaincliCredentials for the test keyring with from_key set to key"""
    return BlackchaincliCredentials(
        keyring_passphrase="",
        keyring_backend="test",
        from_key=key,
        blackfuryd_homedir=f"""{get_required_env_var("HOME")}/.blackfuryd"""
    )


def create_new_blackaddr_and_credentials() -> (str, BlackchaincliCredentials):
    new_account_key = get_shell_output("uuidgen")
    credentials = blackchain_cli_credentials_for_test(new_account_key)
    new_addr = burn_lock_functions.create_new_blackaddr(credentials=credentials, keyname=new_account_key)
    credentials.from_key = new_addr["name"]
    return new_addr["address"], credentials,
