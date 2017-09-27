#!/usr/bin/env python3

import os
import sys
import shutil

DIR = os.path.dirname(os.path.realpath(__file__))
CWD = os.getcwd()

print('Symlink')
if sys.platform == "linux2" or sys.platform == "darwin":
  # Is Linux
  HOME = os.environ['HOME']
  shutil.rmtree(HOME + '/.vim')
  os.remove(HOME + '/.vimrc')
  os.symlink(DIR + '/.vim', HOME + '/.vim')
  os.symlink(DIR + '/.vim/.vimrc', HOME + '/.vimrc')
elif sys.platform == "win32":
  # Is Windows
  print('Updating...')
