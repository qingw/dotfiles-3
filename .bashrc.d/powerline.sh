#!/usr/bin/env bash

# bash-powerline
if [ -z "$INSIDE_EMACS" ]; then
    if [ "$TERM_PROGRAM" == "iTerm.app" ] || [ "$OSTYPE" == "linux-gnu" ]; then
        _SITE_PACKAGES=$(python -c "import sys; print(next(p for p in sys.path if 'site-packages' in p))")
        if [ -f $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh ]; then
                powerline-daemon -q
                POWERLINE_BASH_CONTINUATION=1
                POWERLINE_BASH_SELECT=1
                . $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh
            fi
        fi
        unset _SITE_PACKAGES
    fi
