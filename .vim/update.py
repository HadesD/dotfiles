#!/usr/bin/env python

import os
from subprocess import call

PATHOGEN_URL = 'https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim'

print('Updating...')
print('\n')

print('Pathogen')
call(['curl', '-LSo', os.path.dirname(os.path.abspath(__file__)) + '/autoload/pathogen.vim', PATHOGEN_URL])
print('\n')

print('Submodule')
call(['git', 'submodule', 'update', '--init', '--recursive'])
print('\n')

print('Rebase')
call(['git', 'pull', '--rebase'])
print('\n')

print('Finished')
