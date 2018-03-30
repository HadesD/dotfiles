# This file is NOT licensed under the GPLv3, which is the license for the rest
# of YouCompleteMe.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

from distutils.sysconfig import get_python_inc
import platform
import os
import ycm_core
import sys

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
  '-Wall',
  '-Wextra',
  '-Werror',
  '-Wno-long-long',
  '-Wno-variadic-macros',
  '-fexceptions',
  '-DNDEBUG',
  # You 100% do NOT need -DUSE_CLANG_COMPLETER in your flags; only the YCM
  # source code needs it.
  '-DUSE_CLANG_COMPLETER',
  # THIS IS IMPORTANT! Without the '-x' flag, Clang won't know which language to
  # use when compiling headers. So it will guess. Badly. So C++ headers will be
  # compiled as C headers. You don't want that so ALWAYS specify the '-x' flag.
  # For a C project, you would set this to 'c' instead of 'c++'.
  '-x',
  'c++',
  '-isystem',
  '../BoostParts',
  '-isystem',
  get_python_inc(),
  '-isystem',
  '../llvm/include',
  '-isystem',
  '../llvm/tools/clang/include',
  '-I',
  '.',
  '-I',
  './ClangCompleter',
  '-isystem',
  './tests/gmock/gtest',
  '-isystem',
  './tests/gmock/gtest/include',
  '-isystem',
  './tests/gmock',
  '-isystem',
  './tests/gmock/include',
  '-isystem',
  './benchmarks/benchmark/include',
]

# Clang automatically sets the '-std=' flag to 'c++14' for MSVC 2015 or later,
# which is required for compiling the standard library, and to 'c++11' for older
# versions.
if platform.system() != 'Windows':
  flags.append( '-std=c++17' )

if (os.path.exists('include')):
  flags.extend(['-I', 'include'])

#################################################################################
# CaroOnline
#################################################################################
if (os.path.exists('Common/third_party/asio')):
  flags.extend(['-I', '../Common/third_party/asio/asio/include'])
  if (os.path.exists('Common/third_party/asio')):
    flags.extend(['-I', '../Common/third_party/spdlog/include'])

#################################################################################
#                                   Cocos Dev                                   #
#################################################################################
if (os.path.exists('cocos2d')):
  # COCOS2D_ROOT = os.path
  flags.extend(['-I', 'Classes'])
  flags.extend(['-I', 'cocos2d'])
  flags.extend(['-I', 'cocos2d/cocos'])
  flags.extend(['-I', 'cocos2d/external'])
  flags.extend(['-I', 'cocos2d/cocos/platform'])
  flags.extend(['-I', 'cocos2d/cocos/audio/include'])
  flags.extend(['-D', 'COCOS2D_DEBUG=1'])
  flags.extend(['-D', 'CC_ENABLE_CHIPMUNK_INTEGRATION'])

  if (sys.platform == "darwin"):
    # MacOS
    flags.extend(['-I', 'cocos2d/external/glfw3/include/mac'])
    flags.extend(['-D', 'CC_TARGET_OS_MAC'])
  elif (sys.platform == "linux" or sys.platform == "linux2"):
    # Linux
    flags.extend(['-D', 'CC_TARGET_OS_LINUX'])
    flags.extend(['-D', 'LINUX'])
  elif (sys.platform == "win32"):
    # Windows
    flags.extend(['-I', 'cocos2d/external/glfw3/include/win32'])

flags.extend(['-I', '/srv/emsdk/emscripten/1.37.36/system/include'])

#################################################################################
#                                   LaraCC                                      #
#################################################################################
CPPCMS_INC = 'Dependencies/cppcms/include'
if (os.path.exists(CPPCMS_INC)):
  flags.extend([
    '-I', CPPCMS_INC,
    '-I', CPPCMS_INC + '/booster'
  ])
CPPDB_INC = 'Dependencies/cppdb/include'
if (os.path.exists(CPPDB_INC)):
  flags.extend([
    '-I', CPPDB_INC
  ])
SQLITE_INC = 'Dependencies/sqlite_modern_cpp/include'
if (os.path.exists(SQLITE_INC)):
  flags.extend([
    '-I', SQLITE_INC+'/hdr'
  ])
HOEDOWN_INC = 'Dependencies/hoedown/include'
if (os.path.exists(HOEDOWN_INC)):
  flags.extend([
    '-I', HOEDOWN_INC + '/src'
  ])

#################################################################################
#                                   Godot                                       #
#################################################################################
if (os.path.exists('Dependencies/godot-cpp/include/include')):
  flags.extend([
    '-I', 'Dependencies/godot-cpp/include/include',
    '-I', 'Dependencies/godot-cpp/include/include/core'
  ])
if (os.path.exists('Dependencies/godot_headers/include')):
  flags.extend(['-I', 'Dependencies/godot_headers/include'])
if (os.path.exists('cpp_bindings')):
  flags.extend(['-I', 'cpp_bindings/include'])
  flags.extend(['-I', 'cpp_bindings/include/core'])
if (os.path.exists('godot_headers')):
  flags.extend(['-I', 'godot_headers'])

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if not database:
    return {
      'flags': flags,
      'include_paths_relative_to_dir': DirectoryOfThisScript()
    }

  compilation_info = GetCompilationInfoForFile( filename )
  if not compilation_info:
    return None

  # Bear in mind that compilation_info.compiler_flags_ does NOT return a
  # python list, but a "list-like" StringVec object.
  final_flags = list( compilation_info.compiler_flags_ )

  # NOTE: This is just for YouCompleteMe; it's highly likely that your project
  # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
  # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
  try:
    final_flags.remove( '-stdlib=libc++' )
  except ValueError:
    pass

  return {
    'flags': final_flags,
    'include_paths_relative_to_dir': compilation_info.compiler_working_dir_
  }

