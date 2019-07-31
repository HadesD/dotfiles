#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

subprocess.call(['git', 'config', '--global', 'core.fileMode', 'false'])
subprocess.call(['git', 'config', 'core.fileMode', 'false'])

import update
update.gitUpdate()

DIR = os.path.dirname(os.path.realpath(__file__))
HOME = os.environ['HOME']
DOT_VIM_DIR = HOME + '/.vim'
DOT_VIM_NAME = ''
THIS_VIM_DIR = DIR + '/.vim'
THIS_TMUX_DIR = DIR + '/.tmux'
THIS_I3_DIR = DIR + '/.i3'

def remove(path):
  if (os.path.exists(path)):
    print('Detele :: ' + path)
    if (os.path.islink(path)) or os.path.isfile(path):
      os.remove(path)
    else:
      shutil.rmtree(path)

if (sys.platform == 'linux2') or (sys.platform == 'linux') \
    or (sys.platform == 'darwin') \
    or (sys.platform == 'msys'):
  print('Unix :: found')

  HOME = os.environ['HOME']

  remove(DOT_VIM_DIR)

  print('Vim :: start :: Symlink')
  os.symlink(THIS_VIM_DIR, DOT_VIM_DIR)

  CURRENT_SHELL_RC = HOME + '/.zshrc'
  if (os.path.exists(CURRENT_SHELL_RC)):
    print('ZSH :: start')
    subprocess.call(['sh', DIR + '/scripts/install-oh-my-zsh.sh'])
    f = open(CURRENT_SHELL_RC, 'r')
    r = f.read()
    f.close()
    f = open(CURRENT_SHELL_RC, 'w')
    f.write(
      'export ZSH_CUSTOM='+DIR+'/.local/etc/zshcustom\n'
      + 'export EDITOR=vim\n'
      + r
    )
    f.close()
  else:
    print('ZSH :: NOT FOUND!!!')

  print('Tmux :: start :: Symlink')
  remove(HOME+'/.tmux')
  remove(HOME+'/.tmux.conf')
  os.symlink(THIS_TMUX_DIR, HOME+'/.tmux')
  os.symlink(HOME+'/.tmux/.tmux.conf', HOME+'/.tmux.conf')

  DOT_GITCONFIG_DIR = HOME + '/.gitconfig'
  if (os.path.exists(DOT_GITCONFIG_DIR)):
    print('ZSH :: start')
    f = open(DOT_GITCONFIG_DIR, 'r')
    r = f.read()
    f.close()
    f = open(DOT_GITCONFIG_DIR, 'w')
    f.write(
      r
      + '\n[include]\n'
      + '  path = '+DIR+'/.gitconfig\n'
    )
    f.close()

else:
  print('OS not found')

