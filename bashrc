#!/bin/bash


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $WAYLAND_DISPLAY ]] && shopt -s checkwinsize

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

if [ "$(locale charmap 2>/dev/null)" = "UTF-8" ]; then
    stty iutf8
fi

case ${TERM} in
  Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|tmux*|xterm*)
    PROMPT_COMMAND+=('printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')

    ;;
  screen*)
    PROMPT_COMMAND+=('printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"')
    ;;
esac

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi

