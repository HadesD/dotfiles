#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

subprocess.call(['git', 'config', '--global', 'core.fileMode', 'false'])
subprocess.call(['git', 'config', 'core.fileMode', 'false'])

DIR = os.path.dirname(os.path.realpath(__file__))
HOME = os.environ['HOME']
DOT_VIM_DIR = HOME + '/.vim'
DOT_VIM_NAME = ''
THIS_VIM_DIR = DIR + '/.vim'
THIS_TMUX_DIR = DIR + '/.tmux'

def remove(path):
  if (os.path.exists(path)):
    print('Detele :: ' + path)
    if (os.path.islink(path)) or os.path.isfile(path):
      os.remove(path)
    else:
      shutil.rmtree(path)

def installYCM():
  ycm_dir = THIS_VIM_DIR + '/pack/plugins/start/YouCompleteMe'
  if (os.path.exists(ycm_dir)):
    return
  print('Vim :: start :: YouCompleteMe')
  subprocess.call([
    'git',
    'clone',
    'https://github.com/Valloric/YouCompleteMe.git',
    ycm_dir
  ])
  return
  subprocess.call([
    'git',
    'submodule',
    '--update',
    '--init'
  ], cwd=ycm_dir
  )
  subprocess.call([
    'python',
    'install.py',
    '--all',
  ], cwd=ycm_dir
  )

if (sys.argv[0] == 'ycm'):
  installYCM()
  exit()

if (sys.platform == 'linux2') \
   or (sys.platform == 'darwin') \
   or (sys.platform == 'msys'):
  print('Unix :: found')

  HOME = os.environ['HOME']

  remove(DOT_VIM_DIR)

  # dot_vimrc_file = HOME + '/.vimrc'
  # remove(dot_vimrc_file)

  print('Vim :: start :: Symlink')
  os.symlink(THIS_VIM_DIR, DOT_VIM_DIR)
  # os.symlink(THIS_VIM_DIR + '/vimrc', dot_vimrc_file)

  CURRENT_SHELL_RC = HOME + '/.zshrc'
  if (os.path.exists(CURRENT_SHELL_RC)):
    print('ZSH :: start')
    f = open(CURRENT_SHELL_RC, 'r')
    r = f.read()
    f.close()
    f = open(CURRENT_SHELL_RC, 'w')
    f.write(
      'export ZSH_CUSTOM='+DIR+'/zshcustom\n'
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
  os.symlink(HOME+'/.tmux/oh-my-tmux/.tmux.conf', HOME+'/.tmux.conf')
  os.symlink(HOME+'/.tmux/.tmux.conf.local', HOME+'/.tmux.conf.local')

  DOT_GITCONFIG_DIR = HOME '/.gitconfig'
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

  if sys.platform == 'linux2':
    installYCM()

  elif (sys.platform == "win32"):
    # Is Windows
    HOME = os.environ['HOME']

  print('Auto install is being updated...')
  print('Manual VIM install')
  print('- Copy ./vim to ' + HOME + '/vimfiles')
  print('- Copy ./vim/vimrc to ' + HOME +'/_vimrc')
else:
  print('OS not found')

import update

update.gitUpdate()

