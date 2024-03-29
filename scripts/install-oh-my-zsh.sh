#!/usr/bin/env bash

SCRIPT_NAME=$0
PWD=$(pwd)
DIR=$(dirname ${SCRIPT_NAME})

type -P wget > /dev/null 2>&1
if [ $? -eq 0 ]; then
  sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

