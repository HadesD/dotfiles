# [dot] files config

ALL dot file setting for our work

## Screen Shots

![Full demo](https://i.imgur.com/jGvtw7q.png)

## WHY?

Most of time, I'm working on unix-like OS.
I'm too lazy to config all of theme from-scratch when I re-install my OS, or change my working-computer, server.

## Support

- It now can work correctly on almost UNIX-like OS (both old and new)
- Vim (almost plugin can work on both Windows and linux)
- Tmux
- Zsh with custom folder

## TODO

- Install script for Windows
- Vim support for command-promt/PowerShell on Windows
- Fix error for cross-distro

## Installation

### Clone & Auto Install

```bash
git clone https://github.com/HadesD/dotfiles.git $HOME/dotfiles && \
cd $HOME/dotfiles && \
python install.py
```

### Vim

_**Install Vim :: Ag.vim - Search text all file in dir :Ag**_

- Goto: https://github.com/ggreer/the_silver_searcher#installing
- Ubuntu: sudo apt-get install silversearcher-ag

### ZSH

- Goto: https://github.com/robbyrussell/oh-my-zsh#basic-installation

