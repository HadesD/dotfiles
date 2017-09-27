#!/usr/bin/env python3

import os
import sys
import subprocess

def renewPathogen():
  print('Update Pathogen', '\n')
  subprocess.call([
    'curl', '-LSo',
    os.path.dirname(os.path.abspath(__file__)) + '/.vim/autoload/pathogen.vim',
    'https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim'
  ])
  print('Finished', '\n')

def gitSubmodule():
  print('Submodule', '\n')
  subprocess.call(['git', 'pull', 'origin', 'master'])
  subprocess.call(['git', 'submodule', 'update', '--recursive', '--remote'])
  subprocess.call(['git', 'submodule', 'update', '--recursive', '--init'])

def gitRebase():
  print('Rebase', '\n')
  subprocess.call(['git', 'pull', '--rebase'])

def tmux():
  print('Tmux', '\n')
  subprocess.call(['tmux', 'source', os.path.dirname(os.path.abspath(__file__)) + '/.tmux/.tmux.conf'])

renewPathogen()
gitSubmodule()
gitRebase()
tmux()
