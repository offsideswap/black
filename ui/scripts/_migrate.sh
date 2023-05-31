#!/bin/bash

set -e
UI=$PWD
cd $UI/chains/peggy && ./migrate.sh
cd $UI/chains/eth && ./migrate.sh
cd $UI/chains/black && ./migrate.sh
cd $UI/chains && ./post_migrate.sh