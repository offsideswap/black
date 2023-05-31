#!/bin/bash

killall blackfuryd

rm $(which blackfuryd) 2> /dev/null || echo blackfuryd not install yet ...

rm -rf ~/.blackfuryd

cd ../../../ && make install 