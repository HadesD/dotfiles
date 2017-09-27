# [dot] files config

# Installation

### Clone

```
git clone https://HadesD@github.com/HadesD/dotfiles.git ~/dotfiles && \
cd ~/dotfiles && \
git submodule update --init --recursive
```

### Vim

- Ubuntu

```bash
sudo apt-get install vim-gui-common vim-runtime
```

- Symlink
```
rm -rf ~/.vim && \
ln -s ~/dotfiles/.vim ~/.vim && \
rm -rf ~/.vimrc && \
ln -s ~/.vim/.vimrc ~/.vimrc
```

_**Install YouCompleteMe**_
```bash
cd ~/.vim/bundle/YouCompleteMe && \
./install.py --all
```

_**Install VimProc**_
```
vi
:VimProcInstall
```
_or_
```
cd ~/.vim/bundle/vimproc.vim && make
```

_**Install Ag.vim**_

- Goto: https://github.com/ggreer/the_silver_searcher#installing
- Ubuntu: sudo apt-get install silversearcher-ag

### Tmux

- Symlink

```
ln -s ~/dotfiles/.tmux ~/.tmux && \
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
```

### ZSH

- ZSH_CUSTOM

```
sed -i -e "1i export ZSH_CUSTOM=\$HOME/dotfiles/zshcustom" ~/.zshrc
```
