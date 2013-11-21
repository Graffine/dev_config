# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Get git completion 
if [ -f ~/.git-completion.bash ]; then
	. ~/.git-completion.bash
fi

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

#PS1="[\[\033[1;32m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;36m\]\$(git_branch)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ "

PS1="[\u@\h \033[1;35m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;33m\]\$(git_branch)\[\033[0m\]# "

export PATH=/opt/trendmicro/bin:$PATH


# Graffine specific aliases
alias v1='vim /opt/trendmicro/var/log/wfbsh_ap/logging\:1.log'
alias v2='vim /opt/trendmicro/var/log/wfbsh_ap/logging\:2.log'
alias r1='rm -f /opt/trendmicro/var/log/wfbsh_ap/logging\:1.log'
alias r2='rm -f /opt/trendmicro/var/log/wfbsh_ap/logging\:2.log'
alias vut='vim /opt/trendmicro/var/log/wfbsh_unittest/logging.log'

alias llog='ls -l /opt/trendmicro/var/log/wfbsh_ap/'

alias src='cd /root/projects/wfbs-svc/WFBS_Hosted/'
alias dev='cd /usr/lib/python2.6/site-packages/wfbsh_ap/'

# Cscope database
CSCOPE_DB=/usr/lib/python2.6/site-packages/cscope.out
export CSCOPE_DB
