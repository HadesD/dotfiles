#!/usr/bin/env bash

#__DIR__="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
__DIR__='$HOME/dotfiles'

# Usage: installDotfile SELF_DIR TO_DIR
installDotfile() {
  rm -rf "$2"
  ln -svf "$1" "$2"
}

# Install .vim
installDotfile "$__DIR__/.vim" "$HOME/.vim"

# Install .tmux
installDotfile "$__DIR__/.tmux" "$HOME/.tmux"
installDotfile "$__DIR__/.tmux/.tmux.conf" "$HOME/.tmux.conf"

# Install .gitconfig
if [[ -f "$HOME/.gitconfig" ]]; then
  touch "$HOME/.gitconfig"
fi
INC_DOT_GITCONFIG_STR="path = $__DIR__/.gitconfig"
grep -Fq "$INC_DOT_GITCONFIG_STR" "$HOME/.gitconfig" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo '[include]' >> $HOME/.gitconfig
  echo -e "\t$INC_DOT_GITCONFIG_STR" >> $HOME/.gitconfig
fi

# Install zsh
INC_ZSH_CUSTOM_STR="export ZSH_CUSTOM=$__DIR__/.local/etc/zshcustom"
grep -Fq "$INC_ZSH_CUSTOM_STR" "$HOME/.zshrc" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  type -P zsh > /dev/null 2>&1
  if [ $? -ne 0 ]; then
    type -P wget > /dev/null 2>&1
    if [ $? -eq 0 ]; then
      sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    else
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    fi
  fi
  echo -e "$INC_ZSH_CUSTOM_STR\n$(cat "$HOME/.zshrc")" > "$HOME/.zshrc"
fi
