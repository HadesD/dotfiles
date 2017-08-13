# .tmux
Tmux settings

# Dependences

- Tmux

# Install

```bash
ln -s ~/.tmux/.tmux.conf ~/.tmux.conf && \
chmod -R 0777 ~/.tmux && \
cd ~/.tmux && \
./update.py
```

*Adding for color fix*
```bash
echo "export TERM=screen-256color" | tee ~/.zshrc && \
source ~/.zshrc
```
