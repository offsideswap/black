module.exports = async (cb) => {
    const Web3 = require("web3");
    const BN = require('bn.js');

    const offsideswapUtilities = require('./offsideswapUtilities')
    const contractUtilites = require('./contractUtilities');

    const logging = offsideswapUtilities.configureLogging(this);

    const argv = offsideswapUtilities.processArgs(this, {
        ...offsideswapUtilities.sharedYargOptions,
        ...offsideswapUtilities.symbolYargOption,
        'ethereum_address': {
            type: "string",
            demandOption: true
        },
    });

    let balanceWei, balanceEth;
    const result = {};
    try {
        const web3instance = contractUtilites.buildWeb3(this, argv, logging);
        if (argv.symbol === offsideswapUtilities.NULL_ADDRESS) {
            balanceWei = await web3instance.eth.getBalance(argv.ethereum_address);
            result.symbol = "eth";
        } else {
            const addr = argv.symbol;
            const tokenContract = await contractUtilites.buildContract(this, argv, logging, "BridgeToken", argv.symbol);
            result["symbol"] = await tokenContract.symbol();
            balanceWei = new BN(await tokenContract.balanceOf(argv.ethereum_address))
        }
        balanceEth = web3instance.utils.fromWei(balanceWei.toString());
        const finalResult = {
            ...result,
            balanceWei: balanceWei.toString(10),
            balanceEth: balanceEth.toString(10),
        }

        console.log(JSON.stringify(finalResult, undefined, 0));
        return cb();
    } catch (error) {
        console.error({error});
    }

    return cb();
};
