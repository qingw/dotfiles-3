#!/usr/bin/env python

import sys
sys.path.append("/Users/steamedfish/dotfiles/cider")
print sys.path
from cider import Cider

sys.exit(0)

cider = Cider(cider_dir="~/dotfiles/.cider")
cider.restore()
