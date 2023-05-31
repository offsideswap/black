height=$(blackfuryd --home $CHAINDIR/.blackfuryd q block | jq -r .block.header.height)
seq $height | parallel -k blackfuryd --home $CHAINDIR/.blackfuryd q block {}
