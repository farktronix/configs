# Jacob's .bashrc

alias grep='grep --color'
alias psgrep='ps auxwww | grep -v grep | grep -i'
alias lsgrep='ls -la | grep -i'

alias prb='post-review -o --guess-summary --guess-description'

alias pbpatch='pbaspte | patch -p1'

alias rgrep='find -L . \( -type d -name .svn -prune \) -or \( -type d -name .git -prune \) -or -not -type f -or -print0 | xargs -0 grep -Iie'

#alias emacs='vim'

alias svndiff='svn-view-diffs -r PREV -r HEAD'
alias svnlog='svn log --limit 10'

alias gits='git svn'
alias gitsmerge='git merge --no-commit --squash'

alias gid='branchname=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"`; echo "[$branchname `git id`]"'

alias git='xcrun git'

alias refresh='source ~/.bash_profile'

alias openx='open *.xcodeproj'

# http://www.centerkey.com/tree/
alias tree="ls -R | grep \":$\" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"

# ls variations
alias ls="ls -G -h"
alias l="ls"
alias ll="ls -l"
alias la="ls -la"

alias cdc="cd -"

alias df="df -h"

# list out the top 10 biggest files under the current directory (thanks red0x!)
alias ducks='du -cks * | sort -nr | head -n 10'

alias inode='stat -f %i'

# fix broken nfs mount on OS X
alias mount_nfs='mount_nfs -P'

function parse_git_branch {
    laststat=$?
    gitpath=`which git`
    if [ -z $IPHONE_SIMULATOR_ROOT ]; then
        status=`$gitpath status 2> /dev/null`
        mystat=""
        `echo "$status" | grep "Your branch is behind" > /dev/null 2>&1`
        [[ $? == 0 ]] && mystat=" ↓"
        `echo "$status" | grep "Your branch is ahead" > /dev/null 2>&1`
        [[ $? == 0 ]] && mystat=" ↑"
        `echo "$status" | grep "have diverged" > /dev/null 2>&1`
        [[ $? == 0 ]] && mystat=" ↕"
        [[ $(echo "$status" | tail -n1) != "nothing to commit (working directory clean)" ]] && mystat=" *"

        $gitpath branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$mystat)/"
    fi;
    return $laststat
}

# checks the exit status of the previous command and prints out a :( if it errored
function frowny {
    laststat=$?
    if [ $laststat != 0 ]; then 
        echo " :("
    fi
    return $laststat
}

function setup_prompt {
    local RED="\[\033[01;31m\]"
    local GREEN="\[\033[01;32m\]"
    local LIGHTBLUE="\[\033[01;36m\]"
    local BLUE="\[\033[01;34m\]"

    export PS1="$GREEN\h $LIGHTBLUE\w$GREEN\$(parse_git_branch)$RED\$(frowny)$BLUE \$ \[\033[00m\]" 
    #export PS1="\u@fark \w\$(parse_git_branch)\$(frowny) \$ " 
}


# Change the window title of X terminals 
case $TERM in
	xterm*|rxvt|eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac

export CVS_RSH=ssh

# change the ls colors on BSD ls
export LSCOLORS="GxfxcxdxBxegedabagacad"

export EDITOR=/usr/bin/vim

export HISTTIMEFORMAT="%F %T "

##uncomment the following to activate bash-completion:
#[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

shopt -s cdspell 

export PYTHONPATH="${PYTHONPATH}:~/bin/svn"


export NODE_PATH="${NODE_PATH}:/usr/local/lib/node_modules"

. ~/.git-completion.bash
[ -f ~/.workConfig ] && source ~/.workConfig

# these will be different on every machine
[ -f ~/.mypath ] && source ~/.mypath

setup_prompt
