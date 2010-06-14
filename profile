export HISTFILESIZE=10000
export HISTSIZE=5000

export PATH=/Users/adam/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/Users/adam/bin/j2:/opt/local/lib/postgresql84/bin:$PATH

export ARCHFLAGS="-arch x86_64"
export SVN_EDITOR="vim -f"
export GIT_EDITOR="vim -f"
export EDITOR='vim -f'

export JPY=~/bin/j2/j.py  # tells j.sh where the python script is
. ~/bin/j2/j.sh          # provides the j() function


# Tomcat6 config
export CATALINA_HOME=/Library/Tomcat6
export JAVA_HOME=/Library/Java/Home

# RSpec Autotest
export RSPEC=true  
export AUTOFEATURE=false

# twitter
alias tw='/Users/adam/bin/twitter'

# presently
alias ly='/Users/adam/bin/presently'

# git-svn
alias gsm='git diff | mate'
alias gsr='git-svn rebase'
alias gsd='git-svn dcommit'
alias gsrd='gsr && gsd'

# git
source ~/bin/git-completion.bash
alias gst='git status'
alias gla='git log --author=adam --color --stat'
alias glp="git log --pretty=format:'(%h) %s'"
alias glpa="git log --pretty=format:'(%h) %s - %an'"
alias gpp='git pull && git push'
alias gph='git push heroku'
alias gcnv='git commit -v --no-verify'

function gcnvm
{
  git commit -m "$*" --no-verify
}

function gsl
{
git-svn log -n ${1:-1} | awk '/^-+$/ { next } /^r/ { rev = $1; next } /./ { print rev, $0 }'
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

export PS1='\[\033[1;33m\]\w\[\033[0m\] $(parse_git_branch)\n→ '

alias m='mate .'
# alias oa='ruby ~/workspace/personal/opie_and_anthony/opie_and_anthony_show.rb'
alias rmsvn='find . -name .svn -print0 | xargs -0 rm -rf'
alias ls='ls -l -G -h'
alias ms='mongrel_rails start'
# alias mti='./script/server -t mti'
# alias lt='./script/server -t lifetuner'
alias tl='tail -f log/development.log'
alias tlt='tail -f log/test.log'
alias rc='rake spec:rcov && open coverage/index.html && rake stats'
alias ss='./script/server'
alias sc='./script/console'
alias sct='./script/console test'
alias svn-add-all="svn st | grep ? | awk '{print $2}' | xargs svn add"
alias vi='vim'
alias rp='. ~/.profile'

export CUCUMBER_COLORS=undefined=white:pending=yellow:pending_param=yellow,bold:failed=red:failed_param=red,bold:passed=green:passed_param=green,bold:skipped=cyan:skipped_param=cyan,bold:comment=white:tag=blue

set -o vi
clear

