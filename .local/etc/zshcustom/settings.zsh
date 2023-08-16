#export LC_ALL=en_US.UTF-8
export LC_ALL=C

# Theme setting
RPROMPT="[%D{%H:%M:%S}] [%(?:%{$fg_bold[green]%}:%{$fg_bold[red]%})%?%{$reset_color%}]"
ZSH_THEME="steeef"

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
