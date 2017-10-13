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
THIS_VIM_DIR = DIR + '/' + '.vim'

def remove(path):
  if (os.path.exists(path)):
    print('Detele :: ' + path)
    if (os.path.islink(path)) or os.path.isfile(path):
      os.remove(path)
    else:
      shutil.rmtree(path)

def installYCM():
  print('Vim :: start :: YouCompleteMe')
  subprocess.call([
    'git',
    'clone',
    'https://github.com/Valloric/YouCompleteMe.git',
    '.vim/bundle/YouCompleteMe'
  ])
  print('Goto: ' + DOT_VIM_DIR + '/bundle/YouCompleteMe')
  print('python install.py --all')

def installPowerLineFont():
  print('Vim :: start :: PowerlineFont')
  subprocess.call([
    'git',
    'clone',
    'https://github.com/powerline/powerline.git',
    '.vim/bundle/YouCompleteMe'
  ])
  print('Vim :: start :: PowerLine Font')
  fonts_dir = HOME + '/.fonts'
  if not os.path.exists(fonts_dir):
    os.makedirs(fonts_dir)

  font_name = 'PowerlineSymbols.otf'
  remove(fonts_dir + '/' + font_name)
  os.symlink(DOT_VIM_DIR + '/bundle/powerline/'+font_name, fonts_dir)

  conf_font_dir = HOME + '/.config/fontconfig/conf.d'
  if not os.path.exists(conf_font_dir):
    os.makedirs(conf_font_dir)

  conf_font_name = '10-powerline-symbols.conf'
  remove(conf_font_dir + '/' + conf_font_name)
  font_name = 'PowerlineSymbols.otf'
  os.symlink(
    DOT_VIM_DIR + '/bundle/powerline/',
    conf_font_dir
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
      'export ZSH_CUSTOM=$HOME/dotfiles/zshcustom\n'
      + 'export EDITOR=vim\n'
      + r
    )
    f.close()
  else:
    print('ZSH :: NOT FOUND!!!')

  if sys.platform == 'linux2':
    installYCM()
    installPowerLineFont()

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

