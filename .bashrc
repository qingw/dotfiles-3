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
export PATH=/usr/local/opt/python@2/bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/libexec:~/bin
# required for SpaceVIM with MacVIM GUI
export PYTHONHOME=/usr/local/Frameworks/Python.framework/Versions/Current/

# enable color support
export CLICOLOR=true
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
elif [ -x /usr/local/bin/gdircolors ]; then
    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
fi

# History
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T"
export HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S]  "
export HISTSIZE=""
shopt -s histappend

# HomeBrew API tokens and other secret stuff
source $HOME/.bashrc_secret

if $CLICOLOR ;then
    export PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;32m\]\h\[\033[00m\[:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi


# bash-powerline

if [ -f /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    if [ "$TERM_PROGRAM" == "iTerm.app" ]; then
        powerline-daemon -q
        POWERLINE_BASH_CONTINUATION=1
        POWERLINE_BASH_SELECT=1
        . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
    fi
fi

# ConTeXt minimals
_POSSIBLE_PATH="/Volumes/DATA/ConTeXt /Volumes/MacData/ConTeXt /Volumes/SteamedFish/ConTeXt $HOME/ConTeXt"
for _CONTEXT_PATH in ${_POSSIBLE_PATH}; do
    if [ -d "${_CONTEXT_PATH}" ]; then
        #source ${_CONTEXT_PATH}/tex/setuptex
        export PATH=$PATH:${_CONTEXT_PATH}/tex/texmf-osx-64/bin
        OSFONTDIR="/Library/Fonts/;/System/Library/Fonts/;$HOME/Library/Fonts/"
        break
    fi
done
unset _POSSIBLE_PATH
unset _CONTEXT_PATH

# bash-completion
if [ -n "$BASH_VERSION" -a -z "$BASH_COMPLETION" ]; then
    if [ -r /usr/local/etc/bash_completion ]; then
        . /usr/local/etc/bash_completion
    fi
    if [ -r /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
    if [ -r $HOME/.bash_completion ]; then
        . $HOME/.bash_completion
    fi
    if [ -n "$(command -v pandoc)" ];then
        eval "$(pandoc --bash-completion)"
    fi
fi


# Aliases
alias grep='grep --color=auto'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias pip='pip2'
alias python='python2'
alias emacs="emacsclient -n"
