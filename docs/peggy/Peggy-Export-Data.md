 # Peggy Export Data
 Before upgrade the peggy to Cosmos SDK 0.42, peggy export the data of both ethbridge and oracle into the genesis file. Then new Offsideswap network can get the data like CethReceiverAccount and PeggyTokenList from genesis file.

 ## How to set CethReceiverAccount 
 See the Peggy-Ceth-Account-Set.md in the same folder.

 ## Peggy Token List
 The list is up to date at the runtime of Blackfuryd. The new token will be added into the list after the prophecy completed.

 ## Export data into genesis
 blackfuryd export > genesis.json
 
 the sample file of genesis.json can be seen in the same folder.