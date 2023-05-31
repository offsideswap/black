#!/usr/bin/env bash
rm -rf all.json pending.json completed.json
blackfuryd q dispensation records-by-name ar1 All>> all.json
blackfuryd q dispensation records-by-name ar1 Pending >> pending.json
blackfuryd q dispensation records-by-name ar1 Completed>> completed.json