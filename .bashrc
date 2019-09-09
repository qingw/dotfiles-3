#!/bin/bash

# do nothing if not running interactively

case $- in
    *i*) ;;
    *) return;;
esac

# exports
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESS="-R"
export CVS_RSH=ssh
export EDITOR="vim"
export MYSQL_PS1="(\u@\h) [\d]> "
export PATH=$PATH:~/bin
export GOPATH=$HOME/.go

# History
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T"
export HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S]  "
export HISTFILESIZE=-1
shopt -s histappend

# enable color support
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    export CLICOLOR=true
fi

if $CLICOLOR ;then
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    elif [ -x /usr/local/bin/gdircolors ]; then
        test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
    fi

    if [ "$TERM" == "eterm-color" ]; then
        # emacs handles wrong with color reset
        export PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;32m\]\h:\[\033[01;34m\]\w\[\033[00m\]\$ '
    elif [ "$TERM" == "dumb" ]; then
        export PS1="> "
    else
        export PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;32m\]\h\[\033[00m\[:\[\033[01;34m\]\w\[\033[00m\]\$ '
    fi
fi

# bash-completion
if [ -n "$BASH_VERSION" -a -z "$BASH_COMPLETION" ]; then
    if [ -r /usr/local/etc/bash_completion ]; then
        . /usr/local/etc/bash_completion
    fi
    if [ -r /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
    if [ -r /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
    if [ -r $HOME/.bash_completion ]; then
        . $HOME/.bash_completion
    fi
    if [ -n "$(command -v pandoc)" ];then
        eval "$(pandoc --bash-completion)"
    fi
fi

# Aliases
if $CLICOLOR; then
    alias grep='grep --color=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'
fi
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
if [ -n "$(command -v lsd)" ];then
    alias ls='lsd'
    alias tree='lsd --tree'
elif [ -n "$(command -v exa)" ];then
    alias ls='exa'
    alias tree='exa --tree'
fi

if [ -d "$HOME/.bashrc.d" ]; then
    for i in $HOME/.bashrc.d/*.sh; do
        if [ -r $i ]; then
            source $i
        fi
    done
    unset i
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
