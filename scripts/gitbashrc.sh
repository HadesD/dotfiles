###############################################################################
# GitBash.exe
# vi ~/.bashrc
# source /d/ProgramFiles/scripts/gitbashrc.sh
###############################################################################

#source /d/Documents/Git/emsdk/emsdk_env.sh

export PATH=$PATH:/d/ProgramFiles/cmake-3.12.2-win32-x86/bin
#:/d/Programming/docker

# Check docker-machine
which docker-machine > /dev/null 2>&1
if [ $? -eq 0 ]; then 
	eval $(docker-machine env default)
fi
