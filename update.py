import os
import subprocess

subprocess.call(['git', 'pull', 'origin', 'master'])
subprocess.call(['git', 'submodule', 'update', '--recursive', '--remote'])
subprocess.call(['git', 'submodule', 'update', '--recursive', '--init'])
