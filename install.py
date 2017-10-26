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
  ycm_dir = THIS_VIM_DIR + '/bundle/YouCompleteMe'
  if (os.path.exists(ycm_dir)):
    return
  print('Vim :: start :: YouCompleteMe')
  subprocess.call([
    'git',
    'clone',
    'https://github.com/Valloric/YouCompleteMe.git',
    ycm_dir
  ])
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

def installPowerLineFont():
  print('Vim :: start :: PowerlineFont')
  powerline_dir = THIS_VIM_DIR + '/bundle/powerline'
  if (os.path.exists(powerline_dir)):
    return
  subprocess.call([
    'git',
    'clone',
    'https://github.com/powerline/powerline.git',
    powerline_dir
  ])
  print('Vim :: start :: PowerLine Font')
  fonts_dir = HOME + '/.fonts'
  if not os.path.exists(fonts_dir):
    os.makedirs(fonts_dir)

  font_name = 'PowerlineSymbols.otf'
  remove(fonts_dir + '/' + font_name)

  if not os.path.exists(fonts_dir + '/' + font_name):
    os.symlink(powerline_dir + '/' + font_name, fonts_dir)

  conf_font_dir = HOME + '/.config/fontconfig/conf.d'
  if not os.path.exists(conf_font_dir):
    os.makedirs(conf_font_dir)

  conf_font_name = '10-powerline-symbols.conf'
  remove(conf_font_dir + '/' + conf_font_name)
  font_name = 'PowerlineSymbols.otf'
  if not os.path.exists(conf_font_dir + '/' + conf_font_name):
    os.symlink(
      powerline_dir + '/' + conf_font_name,
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

  print('Tmux :: start :: Symlink')
  remove(HOME+'/.tmux')
  remove(HOME+'/.tmux.conf')
  os.symlink(THIS_TMUX_DIR+'/.tmux', HOME+'/.tmux')
  os.symlink(HOME+'/.tmux/.tmux.conf', HOME+'/.tmux.conf')

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

