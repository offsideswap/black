import { $, nothrow } from "zx";
import { send } from "../lib/send.mjs";

export async function createRelayer({
  blackChainProps,
  otherChainProps,
  registryFrom = `/tmp/localnet/config/registry`,
}) {
  const { chain, home } = otherChainProps;
  const relayerHome = `${home}/relayer`;

  await nothrow($`mkdir -p ${relayerHome}`);
  await nothrow(
    $`ibc-setup init --home ${relayerHome} --registry-from ${registryFrom} --src ${blackChainProps.chain} --dest ${chain}`
  );

  let addresses = await $`ibc-setup keys list --home ${relayerHome}`;
  addresses = addresses.toString().split("\n");

  const blackChainAddress = addresses
    .find((item) => item.includes(`${blackChainProps.chain}`))
    .replace(`${blackChainProps.chain}: `, ``);
  const otherChainAddress = addresses
    .find((item) => item.includes(`${chain}`))
    .replace(`${chain}: `, ``);

  console.log(`blackChainAddress: ${blackChainAddress}`);
  console.log(`otherChainAddress: ${otherChainAddress}`);

  await send({
    ...otherChainProps,
    src: `${chain}-source`,
    dst: otherChainAddress,
    amount: 10e10,
    node: `tcp://127.0.0.1:${otherChainProps.rpcPort}`,
  });

  return {
    blackChainAddress,
    otherChainAddress,
    blackSendRequest: {
      ...blackChainProps,
      src: `${blackChainProps.chain}-source`,
      dst: blackChainAddress,
      amount: 10e10,
      node: `tcp://127.0.0.1:${blackChainProps.rpcPort}`,
    },
  };
}
