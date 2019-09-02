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

# extra PATHs
for i in
    /home/linuxbrew/.linuxbrew
    $HOME/.linuxbrew
    /snap/bin
do
    if [ -d "$i" ]; then
        export PATH="$i/bin:$i/sbin/$PATH"
    fi
done
