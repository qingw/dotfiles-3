#!/usr/bin/env bash

# bash-powerline

# cannot run inside Emacs VTERM
if [ -n "$INSIDE_EMACS" ]; then
    return
fi

if [ "$TERM" == "dumb" ]; then
    return
fi

if [ "$TERM_PROGRAM" != "iTerm.app" ] && [ "$OSTYPE" != "linux-gnu" ]; then
    return
fi

if [ -f /etc/debian_version ]; then
    _SITE_PACKAGES="/usr/share/"
else
    _SITE_PACKAGES=$(python -c "import sys; print(next(p for p in sys.path if 'site-packages' in p and '.local' not in p))")
fi

if [ -f $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh
fi
unset _SITE_PACKAGES
