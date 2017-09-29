#!/usr/bin/env python3

import os
import sys
import subprocess

DIR = os.path.dirname(os.path.abspath(__file__))

def renewPathogen():
  print('Update Pathogen')
  subprocess.call([
    'curl', '-LSo',
    DIR + '/.vim/autoload/pathogen.vim',
    'https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim'
  ])
  print('Finished')

def gitUpdate():
  print('Git :: submodule :: checkout')
  subprocess.call([
    'git', 'submodule', 'foreach',# '--recursive',
    'git', 'checkout', '.'
  ])
  print('Git :: pull')
  subprocess.call(['git', 'pull', 'origin', 'master'])
  print('Git :: rubmodule :: update')
  subprocess.call(['git', 'submodule', 'update', '--recursive', '--remote'])
  subprocess.call(['git', 'submodule', 'update', '--recursive', '--init'])
  print('Git :: rebase')
  subprocess.call(['git', 'pull', '--rebase'])
  print('Git :: submodule :: pull')
  subprocess.call([
    'git', 'submodule', 'foreach',# '--recursive',
    'git', 'pull', 'origin', 'master'
  ])

def tmux():
  print('Tmux')
  subprocess.call(['tmux', 'source', DIR + '/.tmux/.tmux.conf'])

renewPathogen()
gitUpdate()
tmux()
