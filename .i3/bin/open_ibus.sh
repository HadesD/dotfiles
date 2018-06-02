#!/bin/bash

# Run if found ibus
IBUS_RUNNING=$(ps aux | grep /usr/bin/ibus-daemon | grep -v "grep" | awk '{print $2}')
if type "/usr/bin/ibus-daemon" > /dev/null; then
  if [[ -z $IBUS_RUNNING ]]; then
    /usr/bin/ibus-daemon -drx
  fi
fi

