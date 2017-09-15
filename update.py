#!/usr/bin/env python

import os
import sys
import subprocess

print('Update Pathogen', '\n')
subprocess.call([
  'curl', '-LSo',
  os.path.dirname(os.path.abspath(__file__)) + '/.vim/autoload/pathogen.vim',
  'https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim'
])
print('Finished', '\n')

print('Submodule', '\n')
subprocess.call(['git', 'pull', 'origin', 'master'])
subprocess.call(['git', 'submodule', 'update', '--recursive', '--remote'])
subprocess.call(['git', 'submodule', 'update', '--recursive', '--init'])

print('Rebase', '\n')
subprocess.call(['git', 'pull', '--rebase'])

print('Tmux', '\n')
subprocess.call(['tmux', 'source', os.path.dirname(os.path.abspath(__file__)) + '/.tmux/.tmux.conf'])
