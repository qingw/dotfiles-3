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
        if ! alias ls >dev/null 2>&1; then
            alias ls='ls --color=auto'
        fi
    fi
    alias open='xdg-open'
fi

# LinuxBrew
if [ -d /home/linuxbrew/.linuxbrew ]; then
    export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin/$PATH"
elif [ -d "$HOME/.linuxbrew" ]; then
    export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
fi

# snap
if [ -d /snap/bin ]; then
    export PATH="/snap/bin:$PATH"
fi
