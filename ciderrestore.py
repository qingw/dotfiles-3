#!/usr/bin/env python

import sys
sys.path.append("~/dotfiles/cider")
from cider import Cider

cider = Cider(cider_dir="~/dotfiles/.cider")
cider.restore()
