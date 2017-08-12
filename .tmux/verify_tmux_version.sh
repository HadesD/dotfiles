#!/usr/bin/env bash

function verify_tmux_version
{
  tmux_home=~/.tmux
  tmux_version="$(tmux -V | cut -c 6-)"

  if [[ $(echo "$tmux_version >= 2.3" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_home/configs/tmux_2.3.conf"
  elif [[ $(echo "$tmux_version >= 2.1" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_home/configs/tmux_2.1.conf"
  elif [[ $(echo "$tmux_version >= 1.9" | bc) -eq 1 ]] ; then
    tmux source-file "$tmux_home/configs/tmux_1.9.conf"
  else
    tmux source-file "$tmux_home/configs/tmux_1.9_down.conf"
  fi
}

verify_tmux_version

