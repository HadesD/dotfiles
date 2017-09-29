#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

subprocess.call(['git', 'config', '--global', 'core.fileMode', 'false'])

DIR = os.path.dirname(os.path.realpath(__file__))
CWD = os.getcwd()

if (sys.platform == 'linux2') or (sys.platform == 'darwin'):
  print('Unix :: found')

  HOME = os.environ['HOME']

  print('Vim :: start :: Delete ~/.vim')
  dot_vim_dir = HOME + '/.vim'
  if (os.path.exists(dot_vim_dir)):
    if (os.path.islink(dot_vim_dir)):
      os.remove(dot_vim_dir)
    else:
      shutil.rmtree(dot_vim_dir)

  print('Vim :: start :: Delete ~/.vimrc')
  dot_vimrc_file = HOME + '/.vimrc'
  if (os.path.exists(dot_vimrc_file)):
    os.remove(dot_vimrc_file)

  print('Vim :: start :: Symlink')
  os.symlink(DIR + '/.vim', dot_vim_dir)
  os.symlink(DIR + '/.vim/.vimrc', dot_vimrc_file)
elif (sys.platform == "win32"):
  # Is Windows
  print('Updating...')
else:
  print('OS not found')

import update

update.renewPathogen()
update.gitSubmodule()
update.tmux()
