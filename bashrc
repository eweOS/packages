#!/bin/bash
alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

if [ "$(locale charmap 2>/dev/null)" = "UTF-8" ]; then
    stty iutf8
fi

shopt -s checkwinsize
