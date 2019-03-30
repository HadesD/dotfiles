#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export LC_ALL=en_US.UTF-8
export EDITOR=vim

if [ -z "$TMUX"  ]; then
  export TERM=xterm-256color
fi

# # `Frozing' tty, so after any command terminal settings will be restored
export GIT_LFS_SKIP_SMUDGE=1

alias vi=vim
alias lss='ls -la --block-size=h'

if [ -f ${DIR}/_os/${OSTYPE}.sh ]; then
  source ${DIR}/_os/${OSTYPE}.sh
fi

unset OSH_THEME
export OSH_THEME='candy'

