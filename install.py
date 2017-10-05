#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

subprocess.call(['git', 'config', '--global', 'core.fileMode', 'false'])
subprocess.call(['git', 'config', 'core.fileMode', 'false'])

DIR = os.path.dirname(os.path.realpath(__file__))
CWD = os.getcwd()

def remove(path):
  if (os.path.exists(path)):
    print('Detele :: ' + path)
    if (os.path.islink(path)) or os.path.isfile(path):
      os.remove(path)
    else:
      shutil.rmtree(path)

if (sys.platform == 'linux2') or (sys.platform == 'darwin') or (sys.platform == 'msys'):
  print('Unix :: found')

  HOME = os.environ['HOME']

  dot_vim_dir = HOME + '/.vim'
  remove(dot_vim_dir)
  this_vim_dir = DIR + '/vim'

  dot_vimrc_file = HOME + '/.vimrc'
  remove(dot_vimrc_file)

  print('Vim :: start :: Symlink')
  os.symlink(this_vim_dir, dot_vim_dir)
  os.symlink(this_vim_dir + '/vimrc', dot_vimrc_file)

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

  try:
    font_name = 'PowerlineSymbols.otf'
    remove(fonts_dir + '/' + font_name)
    os.symlink(dot_vim_dir + '/vim/bundle/powerline/'+font_name, fonts_dir)
  except:
    print('Symlink :: error')

  conf_font_dir = HOME + '/.config/fontconfig/conf.d'
  if not os.path.exists(conf_font_dir):
    os.makedirs(conf_font_dir)

  conf_font_name = '10-powerline-symbols.conf'
  remove(conf_font_dir + '/' + conf_font_name)
  try:
    font_name = 'PowerlineSymbols.otf'
    os.symlink(
      dot_vim_dir + '/bundle/powerline/',
      conf_font_dir
    )
  except:
    print('Symlink :: error')

  print('Vim :: start :: fonts :: cache')
  subprocess.call(['fc-cache', '-vf', fonts_dir])

  print('Vim :: start :: YouCompleteMe')
  print('-- Goto: ' + dot_vim_dir + '/bundle/YouCompleteMe')
  print('./install --all')

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
