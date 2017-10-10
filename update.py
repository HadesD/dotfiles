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
  print('Git :: rebase')
  subprocess.call(['git', 'pull', '--rebase'])
  print('Git :: submodule :: pull')
  subprocess.call([
    'git', 'submodule', 'foreach',
    'git', 'pull', 'origin', 'master'
  ])

def ycmUpdate():
  print('Vim :: YouCompleteMe :: pull')
  YCM_DIR=THIS_VIM_DIR + '/bundle/YouCompleteMe'
  subprocess.call(['git', 'pull'], cwd=YCM_DIR)

  print('Vim :: YouCompleteMe :: submodule')
  subprocess.call(
    ['git', 'submodule', 'update', '--init', '--recursive'],
    cwd=YCM_DIR
  )
  subprocess.call(
    [
      'git', 'submodule', 'foreach',
      'git', 'pull', 'origin', 'master'
    ],
    cwd=YCM_DIR
  )

gitUpdate()
ycmUpdate()
