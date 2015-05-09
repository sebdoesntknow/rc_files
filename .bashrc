# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

export EDITOR="vim"
export PATH=$HOME/bin:$PATH
export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
#export PS1="\[\033[01;31m\]\u@\033[01;32m\h\[\033[01;34m\] \w \$\[\033[00m\] "

alias mp="mplayer"
alias nc="netcat"
alias ncmpc="ncmpc --host=/var/run/mpd.sock --no-mouse -c"

hh() { /usr/bin/ssh -l root $@; };
g() { /usr/bin/gcc $1 -o "${1%%.*}"; };
# QM stuff below
qmgw() { /usr/bin/ssh -l seb gw.qm; };

function digs() { /usr/bin/dig $@ +short ; };

function genpasswd() {                                                                                               
        local l=$1                                                                                                   
        [ "$l" == "" ] && l=20                                                                                       
        tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs                                                      
}

#if [ "$PS1" ]                                                                                                        
#then                                                                                                                 
#    complete -cf sudo                                                                                                
#fi                                                                                                                   
                                                                                                                     
#special screen-specific stuff for window titles                                                                     
case $TERM in                                                                                                        
    screen*)                                                                                                         
        trap 'echo -ne "\ek${BASH_COMMAND%%\ *}\e\\"' DEBUG                                                          
        #PROMPT_COMMAND='echo -ne "\ek$(short_pwd 15)\e\\"'                                                          
        ;;                                                                                                           
esac

