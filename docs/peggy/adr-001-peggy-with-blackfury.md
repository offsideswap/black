# ADR 001: Peggy integration with Blackfury

## Changelog

- 2020/10/21: Initial version

## Status

*Proposed*

## Context
In this ADR, the two possible solutions for Blackchain are listed, and the pros and cons are compared with each other. This ADR explains the reason behind the current implementation and what the ideal architecture would be like.
### Summary

In Blackchain's MVP, there are two major programs, Peggy and Blackfury. Peggy works as the bridge to Ethereum and can transfer assets to and from a Cosmos SDK blockchain. Blackfury is based on Cosmos SDK, its major functionality is to provide liquidity pools and enable token swaps. By combine the two components again, it is possible to provide liquidity with pegged tokens whose source tokens are on Ethereum. 

From architecture point of view, there are two solutions for Blackchain.
1. Peggy and Blackfury each have their own ledger.  Pegged tokens are created in Peggy's peg zone ledger which can communicate and transfer value to Blackfury's ledger (Blackchain) via IBC. It is an ideal solution as described in more detail here - https://blog.cosmos.network/the-internet-of-blockchains-how-cosmos-does-interoperability-starting-with-the-ethereum-peg-zone-8744d4d2bc3f. However, IBC, at the time write the ADR, is not mature enough for development. 

2. Peggy and Blackfury co-exist in the same ledger, they share accounts and balances. This solution delivers Peggy as its own module in Blackfury.  It's not ideal, but it is easier to implement while IBC matures.

### Pros and Cons

1. Seperate Ledger Solution

Pros: Peggy and Blackfury can develop and extend seperately, totally decoupled. Peggy can be focused on recording cross chain assets transfers with its own validator set, tokenized incentives for maintaining consensus, and its own native token.  This validator set would be dedicated to supporting other Cosmos SDK chains besides Blackchain.

Cons: Peggy and Blackfury would need IBC support, which is not currently used in any production environment yet.  Blackchain users who want to swap or pool with an Ethereum token would need two transactions.  The first would be transferring an asset from Ethereum to Peggy's peg zone.  The second would be transferring the pegged asset from the peg zone to Blackchain via IBC.

2. Shared Ledger Solution

Pros: It is much easier to deploy and maintenence since all operations like cross-chain token transfer, adding liquidity, and swapping tokens would be processed by a single chain.  There would be no dependency on IBC.

Cons: For the long term, the system is hard to scale out. For example, all Blackfury operators would also need to deploy a Ethereum node process Ethereum's high gas fees.  This increases the labor costs of running a Blackfury validator in a way that is unsustainable as Blackchain bridges to more blockchains besides Ethereum.

## Decision
We choose the second solution to implement now. The major reason is the IBC still in development and not mature enough for production usage at this time. We will keep our eyes on the maturity of IBC and make a switch when we judge it is ready.

We will decouple the cross-chain transfer functions (native to Peggy) and liquidity and swap (native to Blackfury) at the module level. This will make it easier for us to update to IBC when needed

## Consequences

### Positive

- We can quickly deliver our MVP

### Negative

- Nothing major

### Neutral

- Nothing major

## References

https://blog.cosmos.network/the-internet-of-blockchains-how-cosmos-does-interoperability-starting-with-the-ethereum-peg-zone-8744d4d2bc3f
