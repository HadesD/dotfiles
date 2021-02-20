export LC_ALL=en_US.UTF-8
# Theme setting
# unset ZSH_THEME
export ZSH_THEME="mortalscumbag"

# alias vim="stty stop '' -ixoff ; vim"
export EDITOR=vim
export SHELL=$(which zsh)
if [ -z "$TMUX"  ]; then
  export TERM='xterm-256color'
fi

alias vi=vim
alias lss='ls -la --block-size=h'

# # `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
export GIT_LFS_SKIP_SMUDGE=1

export PATH=$HOME/.local/bin:$HOME/.local/usr/bin:$PATH

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon

