export HISTFILESIZE=10000
export HISTSIZE=5000

# Node.js
export NODE_PATH=/usr/local/lib/node_modules

# PATH
export PATH=/Users/adam/bin:/usr/bin:$PATH



# Macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


# MySQL
export PATH=/usr/local/mysql/bin:$PATH


# PostgreSQL
export PATH=/opt/local/lib/postgresql90/bin:$PATH

alias pgstart="sudo su postgres -c '/opt/local/lib/postgresql90/bin/pg_ctl -D /opt/local/var/db/postgresql90/defaultdb -l /opt/local/var/log/postgresql90/postgres.log start'"
alias pgstop="sudo su postgres -c '/opt/local/lib/postgresql90/bin/pg_ctl -D /opt/local/var/db/postgresql90/defaultdb stop -m fast'"
alias pgstatus="sudo su postgres -c '/opt/local/lib/postgresql90/bin/pg_ctl status -D /opt/local/var/db/postgresql90/defaultdb'"


# Vim
alias v='mvim .'
alias vi='vim'

set -o vi


# Python quick directory navigation - watches where you cd, ranks and remembers
#   and allows for quick retrieval.
# 
# Example
#
#   j workspace
#   #=> /Users/happy/something/workspace
#
# Results 
export JPY=/Users/adam/bin/j2/j.py
export PATH=/Users/adam/bin/j2:$PATH


# Ruby
alias b='bundle exec $*'
alias tl='tail -f log/development.log'

function heftiest {
  for file in $(find app$1/**/*.rb -type f); do wc -l $file ; done  | sort -r | head
}

# Rails

alias r='rails'

# Mutt
# mutt; set download folder
alias mutt='cd ~/Downloads; mutt'


# Subversion (svn)
export SVN_EDITOR="vim -f"

# Recursively remove all .svn folders within a project.
#   Mostly useful when moving a project from svn to git.
alias rmsvn='find . -name .svn -print0 | xargs -0 rm -rf'


# Git
source ~/bin/git-completion.bash
export GIT_EDITOR="vim -f"

alias grm="gst | grep deleted | awk {'print \$3'} | xargs git rm"
alias gst='git status'
alias gla='git log --author=adam --color --stat'
alias glp="git log --pretty=format:'(%h) %s'"
alias glpa="git log --pretty=format:'(%h) %s - %an'"
alias gpp='git pull && git push'
alias gph='git push heroku'
alias gcnv='git commit -v --no-verify'
alias gl='git log --no-merges --pretty=format:"%Cgreen%h%Creset%x09%an%x09%Cblue%ar%Creset%x09%s"'

function gcnvm {
  git commit -m "$*" --no-verify
}

# ⚠ ☢ ☠
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "⚡"
}

function parse_git_branch_no_formatting {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1 $(parse_git_dirty)/"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1) $(parse_git_dirty)/"
}

# git-svn
alias gsm='git diff | mate'
alias gsr='git-svn rebase'
alias gsd='git-svn dcommit'
alias gsrd='gsr && gsd'

function gsl {
  git-svn log -n ${1:-1} | awk '/^-+$/ { next } /^r/ { rev = $1; next } /./ { print rev, $0 }'
}


# Bash
export EDITOR='vim'

alias timestamp='date +%s'
alias tw='~/bin/twitter'
alias top='top -o cpu'
alias nb='newsbeuter'
alias ls='ls -l -G -h'

# reload profile
alias rp='. ~/.profile'

export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\] $(parse_git_branch)\n→ '


# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
