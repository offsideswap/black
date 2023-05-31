# Offsideswap - Clp Basics Tutorial

#### demo video

* https://youtu.be/B2cn9Aag3sg

#### Previous tutorial 

* Peggy ethBridge: https://github.com/Offsideswap/blackfury/blob/develop/docs/tutorials/peggy%20tutorial.md

#### Dependencies:

    0. `git clone git@github.com:Offsideswap/blackfury.git`
        

#### What are they

Continuous liquidity pools are a way to pool assets that can then be used in a decentralised blockchain to enable the exchange/swapping from one asset to another without the need for a private off chain exchange. At the sametime providing a yield/return to the liquidity providers based on the pool units each provider has within a pool.

When used with the use of peg-zone as demonstrated a past video, this will enable cross chain swaps from one peg-zone to another. 

#### Setup 

1. Initialize the local chain run; `./scripts/init.sh`

2. Start the chain; `./scripts/run.sh`

3. Check to see you have two local accounts/keys setup; `blackfuryd keys list --keyring-backend=test`

```
- name: akasha
  type: local
  address: black1l7hypmqk2yc334vc6vmdwzp5sdefygj2ad93p5
  pubkey: '{"@type":"/cosmos.crypto.secp256k1.PubKey","key":"A0mB4PyE5XeS3sNpFXIX536INyNoJHkMu1DEQ8FgH8Mq"}'
  mnemonic: ""
- name: mkey
  type: multi
  address: black1kkdqp4dtqmc7wh59vchqr0zdzk8w2ydukjugkz
  pubkey: '{"@type":"/cosmos.crypto.multisig.LegacyAminoPubKey","threshold":2,"public_keys":[{"@type":"/cosmos.crypto.secp256k1.PubKey","key":"AvUEsFHbsr40nTSmWh7CWYRZHGwf4cpRLtJlaRO4VAoq"},{"@type":"/cosmos.crypto.secp256k1.PubKey","key":"A0mB4PyE5XeS3sNpFXIX536INyNoJHkMu1DEQ8FgH8Mq"}]}'
  mnemonic: ""
- name: black
  type: local
  address: black1syavy2npfyt9tcncdtsdzf7kny9lh777yqc2nd
  pubkey: '{"@type":"/cosmos.crypto.secp256k1.PubKey","key":"AvUEsFHbsr40nTSmWh7CWYRZHGwf4cpRLtJlaRO4VAoq"}'
  mnemonic: ""
```

4. Check your seed account balance/s;

   `blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test)`
   
   `blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test)`

#### Create and query pools

note: 
* the minimum threshold for native amount is 10^18 fury.
* the minimum transaction fee for these operations is 10^17 fury.

1. Create the first pool for ceth; 
`blackfuryd tx clp create-pool --from black --keyring-backend test --symbol ceth --nativeAmount 2000000000000000000 --externalAmount 2000000000000000000 --fees 100000000000000000fury --chain-id localnet -y`

2. Create another pool for cdash with a different account; 
`blackfuryd tx clp create-pool --from akasha --keyring-backend test --symbol cdash --nativeAmount 3000000000000000000 --externalAmount 3000000000000000000 --fees 100000000000000000fury --chain-id localnet -y`

3. Check funds left on first account; `blackfuryd q bank balances $(blackfuryd keys show black -a --keyring-backend=test)`

4. Check funds left on second account; `blackfuryd q bank balances $(blackfuryd keys show akasha -a --keyring-backend=test)`

5. Query all clp pools; `blackfuryd q clp pools`

6. Query the ceth pool; `blackfuryd q clp pool ceth`

7. Query an accounts liquidity provider `blackfuryd q clp lp ceth $(blackfuryd keys show black -a --keyring-backend=test)`

#### Add Extra liquidity  (Continuing from above)

1. Add more liquidity for ceth from black account; 
`blackfuryd tx clp add-liquidity --from black  --keyring-backend test --symbol ceth --nativeAmount 1000000000000000000 --externalAmount 1000000000000000000 --fees 100000000000000000fury --chain-id localnet -y`

2. Add more liquidity for cdash from other account; 
`blackfuryd tx clp add-liquidity --from akasha  --keyring-backend test --symbol cdash --nativeAmount 1000000000000000000 --externalAmount 1000000000000000000  --fees 100000000000000000fury --chain-id localnet -y`

#### Swap via the pools 

1. Swap some ceth for cdash via the black key/account; 
`blackfuryd tx clp swap --from black --keyring-backend test --sentSymbol ceth --receivedSymbol cdash --sentAmount 200 --minReceivingAmount 0 --fees 100000000000000000fury --chain-id localnet -y`

2. Swap some cdash for ceth via the akasha key/account;
`blackfuryd tx clp swap --from akasha --keyring-backend test --sentSymbol cdash --receivedSymbol ceth --sentAmount 222 --minReceivingAmount 0 --fees 100000000000000000fury --chain-id localnet -y`

#### Removing liquidity (Continuing from above)

### Basic Options 
 
```--asymmetry```         -10000 = 100% Native Asset, 0 = 50% Native Asset 50% External Asset, 10000 = 100% External Asset

```--wBasis```            0 = 0%, 10000 = 100%, Remove 0-100% of liquidity symmetrically for both assets of the pair

E.g

1. Remove 50% of black's liquidity in fury/ceth symmetrically (equal fury/ceth); 
`blackfuryd tx clp remove-liquidity --from black --keyring-backend test --symbol ceth --wBasis 5000 --asymmetry 0 --fees 100000000000000000fury --chain-id localnet -y`

2. Remove 10% of akasha's liquidity in fury/dash symmetrically (equal fury/dash);
`blackfuryd tx clp remove-liquidity --from akasha --keyring-backend test --symbol cdash --wBasis 1000 --asymmetry 0 --fees 100000000000000000fury --chain-id localnet -y`

#### Coming  

* Liquidity fees model  ... 
* Move minor api/ux enhancements ...le_previous_wrap)

#### Feature Requests / Bug reports

* https://github.com/Offsideswap/blackfury/issues/new/choose


#### References

   * https://medium.com/thorchain/thorchains-liquidity-breakthrough-85a0fdbcd396
   * https://blog.cosmos.network/the-internet-of-blockchains-how-cosmos-does-interoperability-starting-with-the-ethereum-peg-zone-8744d4d2bc3f
