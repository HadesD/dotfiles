# Vim-Settings

Setting for vim in cross platform.

# Infomations

**Plugins**
- Pathogen
- See more at [Plugin lists](https://github.com/HadesD/.vim/tree/master/bundle)

# Installation

**Ubuntu**
```bash
sudo apt-get install vim-gui-common vim-runtime clang1 clang-3.8-dev
```

**Clone and Install**
```bash
git clone https://github.com/HadesD/.vim.git ~/.vim && \
ln -s ~/.vim/.vimrc ~/.vimrc && \
ln -s ~/.vim/.tmux.conf ~/.tmux.conf && \
./update.py
```
*Install YouCompleteMe*
```bash
cd ~/.vim/bundle/YouCompleteMe && \
./install.py --all
```
