# [dot] files config

# Installation

### Clone

```
git clone git@github.com:HadesD/dotfiles.git ~/dotfiles
```

### Vim

- Ubuntu

```bash
sudo apt-get install vim-gui-common vim-runtime clang1 clang-3.8-dev
```

- Symlink
```
ln -s ~/dotfile/.vim ~/.vim && \
ln -s ~/.vim/.vimrc ~/.vimrc
```

*Install YouCompleteMe*
```bash
cd ~/.vim/bundle/YouCompleteMe && \
./install.py --all
```

### Tmux

- Symlink

```
ln -s ~/dotfile/.tmux ~/.tmux && \
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
```
