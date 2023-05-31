#!/bin/bash
pid_blackfury=$(ps aux | grep "blackfuryd start" | grep -v grep | awk '{print $2}')
# pid_rest=$(ps aux | grep "blackfuryd rest-server" | grep -v grep | awk '{print $2}')

if [[ ! -z "$pid_blackfury" ]]; then 
  kill -9 $pid_blackfury
fi

# if [[ ! -z "$pid_rest" ]]; then 
#   kill -9 $pid_rest
# fi