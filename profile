PATH='/usr/local/bin:/bin:/usr/bin'
export PATH

[ -z "$TERM" ] && TERM=linux
[ -z "$PAGER" ] && PAGER=less
[ -z "$EDITOR" ] && EDITOR=vi
export TERM PAGER EDITOR

# Source global bash config, when interactive but not posix or sh mode
if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r /etc/bashrc
then
	. /etc/bashrc
fi

