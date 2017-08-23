# Theme setting
unset ZSH_THEME
# ZSH_THEME="amuse"
export ZSH_THEME="candy"

alias vim="stty stop '' -ixoff ; vim"
alias vi=vim
# # `Frozing' tty, so after any command terminal settings will be restored
ttyctl -f
