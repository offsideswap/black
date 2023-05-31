#!/usr/bin/env bash

cp $GOPATH/src/new/blackfuryd $GOPATH/bin/
cosmovisor start >> blackfury.log 2>&1  &