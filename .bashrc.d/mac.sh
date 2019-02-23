#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$HOME/.bashrc_secret"

    # bash-powerline
    _SITE_PACKAGES=$(python -c "import sys; print(next(p for p in sys.path if 'site-packages' in p))")
    if [ -f $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh ]; then
        if [ "$TERM_PROGRAM" == "iTerm.app" ] && [ -z "$INSIDE_EMACS" ]; then
            /usr/local/bin/powerline-daemon -q
            POWERLINE_BASH_CONTINUATION=1
            POWERLINE_BASH_SELECT=1
            . $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh
        fi
    fi
    unset _SITE_PACKAGES
fi
