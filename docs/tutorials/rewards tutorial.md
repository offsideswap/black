# Offsideswap - Rewards Tutorial

#### Dependencies:

0. `git clone git@github.com:Offsideswap/blackfury.git`
1. `cd blackfury`
2. `git checkout feature/rewards`
3. `make init`

#### Setup

1. Decrease the governance voting period time before first start;
```bash
echo "$(jq '.app_state.gov.voting_params.voting_period = "60s"' $HOME/.blackfuryd/config/genesis.json)" > $HOME/.blackfuryd/config/genesis.json
```

2. Start the chain;
```bash
./scripts/run.sh
```

#### Setup reward periods

The rewards to be distributed are managed through governance.

Each reward period should have an ID field that is unique across all periods ever used.

Start and end blocks are inclusive and must be mutually-exclusive.

The param change proposal takes the format:

```json
{
  "title": "CLP Reward Periods Param Change",
  "description": "Update reward periods",
  "changes": [
    {
      "subspace": "clp",
      "key": "RewardPeriods",
      "value": [
        {
          "id": "Blackrewards 1",
          "start_block": "1",
          "end_block": "200000",
          "allocation": "20000000"
        }
      ]
    },
    {
      "subspace": "clp",
      "key": "LiquidityRemovalCancelPeriod",
      "value": "720"
    },
    {
      "subspace": "clp",
      "key": "LiquidityRemovalLockPeriod",
      "value": "360"
    }
  ],
  "deposit": "10000000stake"
}
```

1. Save the proposal above within a file named `proposal.json`

2. Submit a param change proposal;
```bash
blackfuryd tx gov submit-proposal param-change rewardsproposal.json --from black --keyring-backend test --chain-id localnet -y
```

3. Vote on proposal;
```bash
blackfuryd tx gov vote 1 yes --from black --chain-id localnet --keyring-backend test -y
```

4. Query the proposal to check the proposal status has passed;
```bash
blackfuryd q gov proposals --chain-id localnet
```

5. Verify that the param has changed;
```bash
blackfuryd q params subspace clp RewardPeriods --chain-id localnet
```