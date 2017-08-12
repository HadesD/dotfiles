#!/usr/bin/env python

import os
from subprocess import call

call(["git", "submodule", "update", "--init", "--recursive"])

call(["git", "pull", "--rebase"])

call(["tmux", "source", os.path.dirname(os.path.abspath(__file__)) + "/.tmux.conf"])
