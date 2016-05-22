alias dir='busybox ls -l -a --color=auto'
alias ls='busybox ls --color=auto'
alias x=exit
alias cls=clear
alias edit=nano
export TERMINFO=/data/local/tmp/xbin/terminfo
export TERM=linux
export TMPDIR=/data/local/tmp/tmp
export SPELL="myspell american-english"

LSCOLORS="Exfxcxdxbxegedabagacad" ; export LSCOLORS
export PATH=/data/local/tmp/xbin:$PATH

ENDCOLOR="\033[0m"
BLACK="\033[0;30m"
BLUE="\033[0;34m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
RED="\033[0;31m"
PURPLE="\033[0;35m"
BROWN="\033[0;33m"
GREY="\033[0;37m"
DGREY="\033[1;30m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
B_BLUE="\033[1;34m"
B_GREEN="\033[1;32m"
B_CYAN="\033[1;36m"
B_RED="\033[1;31m"
B_PURPLE="\033[1;35m"

case $(id -u) in
    0)
#          STARTCOLOR='\033[31m';
           STARTCOLOR=$B_RED;
        ;;
    *)
#           STARTCOLOR='\033[36m';
            STARTCOLOR=$B_GREEN;
        ;;
esac



case $TERM in
    xterm*)
        TITLEBAR='\033]0;\u@\h \w \007';
        ;;
    *)
        TITLEBAR="";
        ;;
esac

PS1="$GREY[$DGREY\A $STARTCOLOR\h$GREY] <$DGREY$YELLOW\w/$GREY> $ENDCOLOR$TITLEBAR"

