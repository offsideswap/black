import { pickChains } from "../pickChains.mjs";

test("pick chains", () => {
  const result = pickChains({ chain: "blackfury,cosmos,akash" });

  expect(result).toMatchSnapshot();
});
