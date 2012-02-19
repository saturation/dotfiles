#
# ~/.bashrc
#

#bakcyn='\e[46m' 
PS1='[\w]\n$ '
#PS1=$bakcyn'[\w]\n$ '
PATH=$PATH:/home/miikka/bin

export LC_TIME=fi_FI.UTF-8 

[[ $- != *i* ]] && return

if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
fi

#**********
# HISTORY *
#**********

HISTTIMEFORMAT='%F %T '
HISTFILESIZE=1000000000
HISTSIZE=1000000
HISTCONTROL=ignoredups
shopt -s histappend
PROMPT_COMMAND='history -a'


shopt -s checkwinsize


alias ls='ls --color=auto'
alias reboot='sudo reboot'
alias poweroff='sudo poweroff'

s() { # do sudo, or sudo the last command if no argument given
    if [[ $# == 0 ]]; then
        sudo $(history -p '!!')
    else
        sudo "$@"
    fi
}

extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1		;;
			*.tar.gz)	tar xzf $1		;;
			*.bz2)		bunzip2 $1		;;
			*.rar)		rar x $1		;;
			*.gz)		gunzip $1		;;
			*.tar)		tar xf $1		;;
			*.tbz2)		tar xjf $1		;;
			*.tgz)		tar xzf $1		;;
			*.zip)		unzip $1		;;
			*.Z)		uncompress $1	;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

#if [ "$TMUX" == ""  ]; then
#	tmux
#fi
