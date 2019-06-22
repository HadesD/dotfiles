DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export LC_ALL=en_US.UTF-8
export EDITOR=vim

if [ -z "$TMUX"  ]; then
  export TERM=xterm-256color
fi

export GIT_LFS_SKIP_SMUDGE=1

alias vi=vim
alias lss='ls -la --block-size=h'

OS_CUSTOM_SCRIPT=${DIR}/_os/${OSTYPE}.bash
if [ -f $OS_CUSTOM_SCRIPT ]; then
  source $OS_CUSTOM_SCRIPT
fi

# if [ -z "$BASH_IT_THEME" ]; then
#   unset BASH_IT_THEME
# fi

export BASH_IT_THEME='candy'

