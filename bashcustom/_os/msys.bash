#source /d/Documents/Git/emsdk/emsdk_env.sh

# export PATH=$PATH

_PATH_LIST=(
/d/ProgramFiles/cmake-3.12.2-win32-x86/bin
/d/ProgramFiles/msys2-bin
#:/d/Programming/docker
)
_TEMP_PATH=$PATH
for i in "${_PATH_LIST[@]}"; do
  if [ -d $i ]; then
    _TEMP_PATH=$_TEMP_PATH:$i
  fi
done
export PATH=$_TEMP_PATH

# Check docker-machine
type -P docker-machine > /dev/null 2>&1
if [ $? -eq 0 ]; then
	eval $(docker-machine env default)
fi

