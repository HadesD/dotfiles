#!/usr/bin/env python3

import os
import sys
import subprocess

DIR = os.path.dirname(os.path.abspath(__file__))
HOME = os.environ['HOME']
DOT_VIM_NAME = ''
THIS_VIM_DIR = DIR + '/' + '.vim'

def gitUpdate():
  print('Git :: submodule :: checkout')
  subprocess.call([
    'git', 'submodule', 'foreach',
    'git', 'checkout', '.'
  ])
  print('Git :: pull')
  subprocess.call(['git', 'pull', 'origin', 'master'])
  print('Git :: submodule :: update')
  subprocess.call(['git', 'submodule', 'update', '--init', '--recursive'])
  print('Git :: submodule :: pull')
  subprocess.call([
    'git', 'submodule', 'foreach',
    'git', 'pull', 'origin', 'master'
  ])

if __name__ == '__main__':
  gitUpdate()

