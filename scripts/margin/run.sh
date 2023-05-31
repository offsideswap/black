#!/usr/bin/env bash

set -x

killall blackfuryd

cd ../..
make install
blackfuryd start --trace
