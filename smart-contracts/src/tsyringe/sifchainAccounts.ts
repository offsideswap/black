import {HardhatRuntimeEnvironment} from "hardhat/types";
import {HardhatRuntimeEnvironmentToken,} from "./injectionTokens";
import {SignerWithAddress} from "@nomiclabs/hardhat-ethers/signers";
import {inject, injectable} from "tsyringe";
import {isHardhatRuntimeEnvironment} from "./hardhatSupport";

/**
 * The accounts necessary for testing a blackchain system
 */
export class BlackchainAccounts {
    constructor(
        readonly operatorAccount: SignerWithAddress,
        readonly ownerAccount: SignerWithAddress,
        readonly pauserAccount: SignerWithAddress,
        readonly validatatorAccounts: Array<SignerWithAddress>,
        readonly availableAccounts: Array<SignerWithAddress>
    ) {
    }
}

/**
 * Note that the hardhat environment provides accounts as promises, so
 * we need to wrap a BlackchainAccounts in a promise.
 */
@injectable()
export class BlackchainAccountsPromise {
    accounts: Promise<BlackchainAccounts>

    constructor(accounts: Promise<BlackchainAccounts>);
    constructor(@inject(HardhatRuntimeEnvironmentToken) hardhatOrAccounts: HardhatRuntimeEnvironment | Promise<BlackchainAccounts>) {
        if (isHardhatRuntimeEnvironment(hardhatOrAccounts)) {
            this.accounts = hreToBlackchainAccountsAsync(hardhatOrAccounts)
        } else {
            this.accounts = hardhatOrAccounts
        }
    }
}

export async function hreToBlackchainAccountsAsync(hardhat: HardhatRuntimeEnvironment): Promise<BlackchainAccounts> {
    const accounts = await hardhat.ethers.getSigners()
    const [operatorAccount, ownerAccount, pauserAccount, validator1Account, ...extraAccounts] = accounts
    return new BlackchainAccounts(operatorAccount, ownerAccount, pauserAccount, [validator1Account], extraAccounts)
}
