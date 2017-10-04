#!/usr/bin/env python3

import os
import sys
import shutil
import subprocess

subprocess.call(['git', 'config', '--global', 'core.fileMode', 'false'])
subprocess.call(['git', 'config', 'core.fileMode', 'false'])

DIR = os.path.dirname(os.path.realpath(__file__))
CWD = os.getcwd()

if (sys.platform == 'linux2') or (sys.platform == 'darwin'):
  print('Unix :: found')

  HOME = os.environ['HOME']

  print('Vim :: start :: Delete ~/.vim')
  dot_vim_dir = HOME + '/.vim'
  if (os.path.exists(dot_vim_dir)):
    if (os.path.islink(dot_vim_dir)):
      os.remove(dot_vim_dir)
    else:
      shutil.rmtree(dot_vim_dir)

  print('Vim :: start :: Delete ~/.vimrc')
  dot_vimrc_file = HOME + '/.vimrc'
  if (os.path.exists(dot_vimrc_file)):
    os.remove(dot_vimrc_file)

  print('Vim :: start :: Symlink')
  os.symlink(DIR + '/.vim', dot_vim_dir)
  os.symlink(DIR + '/.vim/vimrc', dot_vimrc_file)

  CURRENT_SHELL_RC = HOME + '/.zshrc'
  if (os.path.exists(CURRENT_SHELL_RC)):
    print('ZSH :: start')
    r = open(CURRENT_SHELL_RC, 'r').read().close()
    w = open(CURRENT_SHELL_RC, 'w').write(
      'export ZSH_CUSTOM=$HOME/dotfiles/zshcustom\n'
      + 'export EDITOR=vim\n'
      + r
    ).close()
  else:
    print('ZSH :: NOT FOUND!!!')

  print('Vim :: start :: PowerLine Font')
  fonts_dir = HOME + '/.fonts'
  if not os.path.exists(fonts_dir):
    os.makedirs(fonts_dir)
  os.symlink(DIR + '/.vim/bundle/powerline/PowerlineSymbols.otf', fonts_dir)
  conf_font_dir = HOME + '/.config/fontconfig/conf.d'
  if not os.path.exists(conf_font_dir):
    os.makedirs(conf_font_dir)
  os.symlink(
    DIR + '/.vim/bundle/powerline/10-powerline-symbols.conf',
    conf_font_dir
  )

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
