#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

# subprocess.call(['git', 'config', '--global', 'core.fileMode', 'false'])
subprocess.call(['git', 'config', 'core.fileMode', 'false'])

DIR = os.path.dirname(os.path.realpath(__file__))
CWD = os.getcwd()

HOME = os.environ['HOME']
DOT_VIM_NAME = ''
THIS_VIM_DIR = DIR + '/' + '.vim'

if (sys.platform == 'linux2') or (sys.platform == 'darwin') or (sys.platform == 'msys'):
  print('Unix :: found')

  DOT_VIM_NAME = '.vim'
  THIS_VIM_DIR = DIR + '/.vim'

  # dot_vimrc_file = HOME + '/.vimrc'
  # remove(dot_vimrc_file)

  print('Vim :: start :: Symlink')
  os.symlink(THIS_VIM_DIR, DOT_VIM_NAME)
  # os.symlink(THIS_VIM_DIR + '/vimrc', dot_vimrc_file)

  CURRENT_SHELL_RC = HOME + '/.zshrc'
  if (os.path.exists(CURRENT_SHELL_RC)):
    print('ZSH :: start')
    f = open(CURRENT_SHELL_RC, 'r')
    r = f.read()
    f.close()
    f = open(CURRENT_SHELL_RC, 'w')
    f.write(
      'export ZSH_CUSTOM=$HOME/dotfiles/zshcustom\n'
      + 'export EDITOR=vim\n'
      + r
    )
    f.close()
  else:
    print('ZSH :: NOT FOUND!!!')

  print('Vim :: start :: PowerLine Font')
  fonts_dir = HOME + '/.fonts'
  if not os.path.exists(fonts_dir):
    os.makedirs(fonts_dir)

  font_name = 'PowerlineSymbols.otf'
  remove(fonts_dir + '/' + font_name)
  os.symlink(DOT_VIM_NAME + '/vim/bundle/powerline/'+font_name, fonts_dir)

  conf_font_dir = HOME + '/.config/fontconfig/conf.d'
  if not os.path.exists(conf_font_dir):
    os.makedirs(conf_font_dir)

  conf_font_name = '10-powerline-symbols.conf'
  remove(conf_font_dir + '/' + conf_font_name)
  font_name = 'PowerlineSymbols.otf'
  os.symlink(
    DOT_VIM_NAME + '/bundle/powerline/',
    conf_font_dir
  )

  print('Vim :: start :: fonts :: cache')
  subprocess.call(['fc-cache', '-vf', fonts_dir])

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

def remove(path):
  if os.path.exists(path) or os.path.islink(path):
    print('Detele :: ' + path)
    if os.path.isfile(path) or os.path.islink(path):
      os.remove(path)
    else:
      shutil.rmtree(path)

def installYCM():
  if os.path.exists(DOT_VIM_NAME):
    ff

  print('Vim :: start :: YouCompleteMe')
  subprocess.call([
    'git',
    'clone',
    'https://github.com/Valloric/YouCompleteMe.git',
    '.vim/bundle/YouCompleteMe'
  ])
  print('Goto: ' + DOT_VIM_NAME + '/bundle/YouCompleteMe')
  print('python ./install --all')


remove(DOT_VIM_NAME)

installYCM()

import update

update.gitUpdate()
