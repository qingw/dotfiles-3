#!/usr/bin/env bash

# Linux related
if [ "$OSTYPE" == "linux-gnu" ]; then
    # Change the window title of X terminals
    case ${TERM} in
      xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
      screen*)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
        ;;
    esac
    if $CLICOLOR ; then
        alias ls='ls --color=auto'
    fi

    # bash-powerline
    _SITE_PACKAGES=$(python -c "import sys; print(next(p for p in sys.path if 'site-packages' in p))")
    if [ -f $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh ]; then
        if [ -z "$INSIDE_EMACS" ]; then
            powerline-daemon -q
            POWERLINE_BASH_CONTINUATION=1
            POWERLINE_BASH_SELECT=1
            . $_SITE_PACKAGES/powerline/bindings/bash/powerline.sh
        fi
    fi
    unset _SITE_PACKAGES
fi
