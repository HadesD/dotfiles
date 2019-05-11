#!/usr/bin/env bash

SCRIPT_NAME=$0
PWD=$(pwd)
DIR=${PWD}/$(dirname ${SCRIPT_NAME})

git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
~/.bash_it/install.sh

sed -i "1s;^;export BASH_IT_CUSTOM=${DIR}\/..\/bashcustom\n;" ~/.bashrc
sed -i "1s;^;export BASH_IT_THEME='candy'\n;" ~/.bashrc

