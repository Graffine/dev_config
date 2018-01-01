# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias doc='docker-compose'

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

PS1="[\u@\h \[\033[1;35m\]\w\[\033[0m\]] \[\033[0m\]\[\033[1;33m\]\$(git_branch)\[\033[0m\]# "

export PATH=/usr/local//bin:$PATH

