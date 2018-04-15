# Theme setting
unset ZSH_THEME
# ZSH_THEME="zeta-zsh-theme/zeta"
# export ZSH_THEME="candy"
export ZSH_THEME="mortalscumbag"

# alias vim="stty stop '' -ixoff ; vim"
alias vi=vim
alias tmux="TERM=xterm-256color tmux"
export EDITOR=vim
alias lss='ls -la --block-size=M'

# # `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
export GIT_LFS_SKIP_SMUDGE=1

export PATH=$HOME/.local/usr/bin:$PATH

# Run if found ibus
IBUS_RUNNING=$(ps aux | grep ibus-daemon | grep -v "grep" | awk '{print $2}')
if [[ -f "$(which ibus-daemon)" ]]; then
  if [[ -z $IBUS_RUNNING ]]; then
    ibus-daemon -drx
  fi
fi

