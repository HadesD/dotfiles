# Run if found ibus
IBUS_RUNNING=$(ps aux | grep ibus-daemon | grep -v "grep" | awk '{print $2}')
if type "ibus-daemon" > /dev/null; then
  if [[ -z $IBUS_RUNNING ]]; then
    ibus-daemon -drx
  fi
fi

