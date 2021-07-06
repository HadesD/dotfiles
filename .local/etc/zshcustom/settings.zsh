export LC_ALL=en_US.UTF-8

# Theme setting
RPROMPT='[%D{%H:%M:%S}]'
if [[ "$(uname -a)" == *"microsoft"* ]]; then
  local ret_status="%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%?%{$reset_color%}"
  RPROMPT="${RPROMPT} [${ret_status}]"
  ZSH_THEME="steeef"
else
  ZSH_THEME="mortalscumbag"
fi

export EDITOR=vim
if [ -z "$TMUX" ]; then
  export TERM='xterm-256color'
fi

alias vi=vim

# # `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
export GIT_LFS_SKIP_SMUDGE=1

export PATH=$PATH:$HOME/.local/bin:$HOME/.local/usr/bin

# so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
