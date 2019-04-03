unsetopt correct_all
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin
export GOPATH=$HOME/go
export PATH=$PATH:/bin
export TERMINAL=alacritty

# NOTE: find aur download/build functions... they seem to be missing


# Vim {{{
#
export BUNDLER_EDITOR="vim"
export EDITOR="vim"

bindkey -v # Use vim keybindings
set -o vi  # Do something else with vim? == setopt, I guess.
#  }}}
# ZSH {{{

ZSH=$HOME/.oh-my-zsh

# }}}

# ZSH / Theme {{{

ZSH_THEME="steeef"

# }}}
# ZSH / oh-my-zsh / plugins {{{
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse zsh-syntax-highlighting)
plugins=(git vi-mode autojump brew bundler cloudapp gitfast git-extras npm kubectl)

source $ZSH/oh-my-zsh.sh

# }}}
# ZSH / Aliases {{{

# https://github.com/kevin-cantwell/nav
# Interactive cd - for when you don't know where you want to go
# Can be used to populate autojump!
cdi() {
  cd "$(nav $@)"
}

alias projector_on=". ~/.screenlayout/dual-with-portrait-and-projector.sh"
alias projector_off=". ~/.screenlayout/dual-with-portrait.sh"

# Mass rename
#
#   mmv *.dat *.dat_old" or "mmv foo.* bar.*
#
#   into a newly opened terminal and it will do as you expect!
#   You can even invoke "mmv **/*2008.mp3 **/*2009.mp3"
autoload -U zmv
alias mmv='noglob zmv -W'

alias as='asciinema'
alias vi='vim'
alias open="xdg-open &>/dev/null"
alias ls="ls -lhG --color=auto --group-directories-first"
alias grep="grep -E --color"
# alias ls="ls -lahG --color=auto" # OSX alias
alias grm="gst | grep deleted | awk {'print \$3'} | xargs git rm"
alias weather="curl http://wttr.in"
alias gcom="git commit -v"

# Python

alias p3="python3"
alias pe="pipenv"
alias pm="python manage.py"
alias pmrs="python manage.py runserver"

# SSH identity / github users
alias gha="gh-adam"
alias ghp="gh-pixel"
alias ghb="gh-buzz"

# git, copy current branch to clipboard
alias b="git name-rev --name-only HEAD | pbcopy"

# Rails development
alias tl="clear; tail -f log/development.log"
alias kwf="killweb; foreman s"
alias bimc="bi && rake db:migrate db:test:clone"

# taskwarrior
# alias t='task'
# alias tm='task modify'
# alias tome='task project:home'
# alias tbay='task project:openbay'

# }}}

# Keys / Backplane {{{
# source $HOME/.env/backplane.sh
hpschd-env() {
  local hpschd=$HOME/.env/hpschd.xyz.sh
  echo "Loading hpchd.xyz env vars..."
  cat $hpschd
  source $hpschd
}

# Deploy Matt's Backplane Env - Site
#
# In backplane root:
#
#   BACKPLANE_SITE=<ip> deploy-hpschd-site
#
deploy-hpschd-site() {
  ./ci reset build_certs download_geodb compile archive; \

  echo "Uploading..."; \
  scp .ci/**/backplane-site*.tgz backplane@$BACKPLANE_SITE:~/; \
  echo ""; \

  echo "Stopping site"; \
  ssh -t backplane@$BACKPLANE_SITE 'sudo systemctl stop backplane-site.service'; \
  echo ""; \

  echo "Stopping site-agent"; \
  ssh -t backplane@$BACKPLANE_SITE 'sudo systemctl stop backplane-agent.service'; \
  echo ""; \

  echo "Stopping acme-agent"; \
  ssh -t backplane@$BACKPLANE_SITE 'sudo systemctl stop backplane-agent-acme.service'; \
  echo ""; \

  echo "Extracting..."; \
  ssh -t backplane@$BACKPLANE_SITE 'tar -xzvf backplane-site*.tgz -C /opt/backplane'; \
  echo ""; \

  echo "Cleanup..."; \
  ssh -t backplane@$BACKPLANE_SITE 'rm ~/backplane-site*.tgz'
  echo ""; \

  echo "Starting site..."; \
  ssh -t backplane@$BACKPLANE_SITE 'sudo systemctl start backplane-site.service'; \
  echo ""; \

  echo "Starting site-agent"; \
  ssh -t backplane@$BACKPLANE_SITE 'sudo systemctl start backplane-agent.service'; \
  echo ""; \

  echo "Starting acme-agent"; \
  ssh -t backplane@$BACKPLANE_SITE 'sudo systemctl start backplane-agent-acme.service'; \
  echo ""; \

  echo "Site status:"; \
  ssh -t backplane@$BACKPLANE_SITE 'sudo systemctl status backplane-site.service'
  echo ""
}

# Deploy Matt's Backplane Env - Edge
#
# In backplane root:
#
#   BACKPLANE_EDGE=<ip> deploy-hpschd-edge
#
deploy-hpschd-edge() {
  ./ci reset build_certs download_geodb compile archive; \

  echo "Uploading..."; \
  scp .ci/**/backplane-server*.tgz backplane@$BACKPLANE_EDGE:~/; \
  echo ""; \

  echo "Stopping service"; \
  ssh -t backplane@$BACKPLANE_EDGE 'sudo systemctl stop backplane-edge.service'; \
  echo ""; \

  echo "Extracting..."; \
  ssh -t backplane@$BACKPLANE_EDGE 'tar -xzvf backplane-server*.tgz -C /opt/backplane'; \
  echo ""; \

  echo "Cleanup..."; \
  ssh -t backplane@$BACKPLANE_EDGE 'rm ~/backplane-server*.tgz'
  echo ""; \

  echo "Starting service..."; \
  ssh -t backplane@$BACKPLANE_EDGE 'sudo systemctl start backplane-edge.service'; \
  echo ""; \

  echo "Service status:"; \
  ssh -t backplane@$BACKPLANE_EDGE 'sudo systemctl status backplane-edge.service'
  echo ""
}

export LINODE_API_KEY=VOZYhPTgCwmMR1DkfwKMraAf0NRggp76sGWjApODRFvhZQIZpfpOtEmPmR919LZj
# }}}
# Keys / Linode / hackon.cc {{{
#
source $HOME/.env/hackon-dyndns.sh
# }}}
# Keys / Openbay {{{
# source $HOME/.envfiles/openbay.sh
# }}}
# Keys / The FretBuzz {{{
# source $HOME/.envfiles/fretbuzz.sh
# }}}
# Keys / Personal / Amazon {{{

# }}}
# Keys / Personal / Imgur {{{
export IMGUR_CLIENT_ID="296a786b2d367de"
export IMGUR_ALBUM_ID="r3wRZ"
# }}}

# ENV / Homebrew {{{

export HOMEBREW_CELLAR='/usr/local/Cellar'
export HOMEBREW_GITHUB_API_TOKEN='a681c62aa0210b90bf25e97cd4ce1d142dd5c980'

# }}}
# ENV / Perl / OPAM configuration {{{

. /Users/adam/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# }}}
# ENV / FZF / Searching {{{

# We're using FZF instead, it's so much better ;)
# bindkey ^R history-incremental-search-backward
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Using ripgrep to power fzf -- https://github.com/BurntSushi/ripgrep
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!.git/*'"

# }}}
# ENV / Github {{{

# export DEV_CI_DRONE_GITHUB_CID="cf31553315a29912af1d"
# export DEV_CI_DRONE_GITHUB_CIS="a26f63646677de710170dab822cf380642325100"

# export CI_HACKON_CC_DRONE_GITHUB_CID="ff3fd7d3a1d61608aab2"
# export CI_HACKON_CC_DRONE_GITHUB_CIS="5cef1549f461232af3ab7e1a885698ab52558931"

# }}}


# Linux specific {{{

# set keyboard repeat in gnome
xset r rate 200 60

# set mouse accel in gnome
xset m 5/1 0

# set proper dpi for asus rog 1440p monitor
# xrandr --dpi 108.79

# set proper dpi for philips 4k monitor
# xrandr --dpi 111.00

export XDG_CONFIG_HOME="$HOME/.config"

# }}}

~/bin/welcome

# vim:foldmethod=marker:foldlevel=0

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/adam/workspace/lib/google-cloud-sdk/path.zsh.inc' ]; then . '/home/adam/workspace/lib/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/adam/workspace/lib/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/adam/workspace/lib/google-cloud-sdk/completion.zsh.inc'; fi
