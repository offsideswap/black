#!/bin/bash 

addr=$1
shift

blackfuryd q auth account ${addr:=${VALIDATOR1_ADDR}} -o json | jq
