/**
 * Given a list of token addresses, fetches metadata for each token.
 * This script is part of the whitlisting process.
 * Please read Whitelist_Update.md for instructions.
 */

require("dotenv").config();
const fs = require("fs");
const axios = require("axios");
const { ethers } = require("hardhat");

const {
  print,
  isValidSymbol,
  generateTodayFilename,
  generateV1Denom,
  BLACKFURY_MODEL,
} = require("./helpers/utils");

const addressListFile = process.env.ADDRESS_LIST_SOURCE;
const destinationFile = generateTodayFilename({
  directory: "data",
  prefix: "whitelist_mainnet_update",
  extension: "json",
});
const blackfuryDestinationFile = generateTodayFilename({
  directory: "data",
  prefix: "blackfury_mainnet_update",
  extension: "json",
});

async function main() {
  print("yellow", "Starting...", true);

  const ERC20Factory = await ethers.getContractFactory("BridgeToken");

  const data = fs.readFileSync(addressListFile, "utf8");
  const addressList = JSON.parse(data);

  print(
    "yellow",
    `Will fetch data for the following addresses:\n${addressList.join(", ")}`,
    true
  );

  const finalList = [];
  const blackfuryList = [];

  let address;
  for (let i = 0; i < addressList.length; i++) {
    try {
      address = addressList[i];
      console.log(`Processing token ${address}. Please wait...`);
      const instance = await ERC20Factory.attach(address);
      const name = await instance.name();
      const decimals = await instance.decimals();
      const symbol = await instance.symbol();

      if (!isValidSymbol(symbol)) {
        print(
          "h_red",
          `Skipping token ${address} (${name}) because it's symbol has spaces or special characters: ${symbol}`
        );
        continue;
      }

      const iconUrl = await getTokenMetadata(address);

      finalList.push({
        address,
        name,
        symbol,
        decimals,
        // below, properties that  UI cares for:
        network: "ethereum",
        homeNetwork: "ethereum",
        imageUrl: iconUrl,
      });

      // Now, the blackfury side:
      const blackfuryObj = { ...BLACKFURY_MODEL };
      const v1Denom = generateV1Denom(symbol);
      blackfuryObj.decimals = decimals;
      blackfuryObj.base_denom = v1Denom;
      blackfuryObj.denom = v1Denom;
      blackfuryList.push(blackfuryObj);

      print(
        "h_green",
        `--> Processed token "${name}" (${symbol}) successfully: ${decimals} decimals.`,
        true
      );
    } catch (e) {
      print(
        "h_red",
        `--> Failed to fetch details of token ${address}: ${e.message}`
      );
    }
  }

  // The output file expects this format:
  const output = {
    array: finalList,
  };

  fs.writeFileSync(destinationFile, JSON.stringify(output, null, 2));
  fs.writeFileSync(
    blackfuryDestinationFile,
    JSON.stringify(blackfuryList, null, 2)
  );

  print("h_green", "The first part is done!");
  print("cyan", `Results have been written to ${destinationFile}`);
  print(
    "magenta",
    `Blackfury results have been written to ${blackfuryDestinationFile}.`
  );
  print(
    "yellow",
    `Please wait while we send the whitelist to the blockchain...`
  );
}

async function getTokenMetadata(address) {
  const response = await axios
    .post(process.env.MAINNET_URL, {
      jsonrpc: "2.0",
      method: "alchemy_getTokenMetadata",
      params: [address],
      id: 1,
    })
    .catch((e) => {
      print("h_red", `-> Cannot find imageUrl. Setting imageUrl to null.`);
      return null;
    });

  return response?.data?.result?.logo;
}

main()
  .catch((error) => {
    console.error({ error });
  })
  .finally(() => process.exit(0));
