# [dot] files config

## Installation

### Clone & Auto Install

```
git clone https://HadesD@github.com/HadesD/dotfiles.git ~/dotfiles && \
cd ~/dotfiles && \
python install.py
```

### Vim

- Ubuntu

```bash
sudo apt-get install vim-gui-common vim-runtime
```

_**Install Vim :: YouCompleteMe**_
```bash
cd ~/.vim/bundle/YouCompleteMe && \
./install.py --all
```

_**Install Vim :: VimProc**_
```
vi
:VimProcInstall
```
_or_
```
cd ~/.vim/bundle/vimproc.vim && make
```

_**Install Vim :: Ag.vim**_

- Goto: https://github.com/ggreer/the_silver_searcher#installing
- Ubuntu: sudo apt-get install silversearcher-ag

### ZSH

- Goto: https://github.com/robbyrussell/oh-my-zsh#basic-installation

- ZSH_CUSTOM

```
sed -i -e "1i export ZSH_CUSTOM=\$HOME/dotfiles/zshcustom" ~/.zshrc
```
