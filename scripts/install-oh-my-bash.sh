#!/usr/bin/env bash

SCRIPT_NAME=$0
PWD=$(pwd)
DIR=${PWD}/$(dirname ${SCRIPT_NAME})

type -P wget > /dev/null 2>&1
if [ $? -eq 0 ]; then
  sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
fi

sed -i "1s;^;export OSH_CUSTOM=${DIR}\/..\/.local\/etc\/bashcustom\n;" ~/.bashrc

