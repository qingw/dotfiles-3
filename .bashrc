# exports
export CLICOLOR=true
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LESS="-R"
export CVS_RSH=ssh
export EDITOR="vim"
export MYSQL_PS1="(\u@\h) [\d]> "
export PATH=/usr/local/bin:/usr/local/sbin:$PATH:~/bin

# History
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T"
export HISTTIMEFORMAT="[%Y-%m-%d %H:%M:%S]  "
export HISTSIZE=""

# we want PlistBuddy in /usr/libexec/
export PATH=$PATH:/usr/libexec

# HomeBrew API tokens and other secret stuff
source $HOME/.bashrc_secret

if $CLICOLOR ;then
    export PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[01;32m\]\h\[\033[00m\[:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi


# bash-powerline

if [ -f /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    if [ "$TERM_PROGRAM" == "iTerm.app" ]; then
        . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
    fi
fi

# ConTeXt minimals
if [ -d /Volumes/DATA/ConTeXt ]; then
    . /Volumes/DATA/ConTeXt/tex/setuptex
    OSFONTDIR="/Library/Fonts/;/System/Library/Fonts/;$HOME/Library/Fonts/"
fi

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
alias emacs="emacsclient -n"
