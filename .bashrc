#source ~/.bash-git-prompt/gitprompt.sh
#source ~/app/git-completion.bash

export HISTSIZE=1000000 
export HISTFILESIZE=1000000
export HISTCONTROL=ignoredups
export HISTIGNORE="&:cd:ls:l:cl:c;l:la:[bf]g:exit"
export LC_ALL='en_US.UTF-8'

export PATH=$PATH:~/app/
export PATH="$(yarn global bin):$PATH"
export CHROME_BINARY="/usr/bin/chromium.sh"
export CHROME_BIN="/usr/bin/chromium.sh"
export EDITOR='vim'
export CLASSPATH=".:/usr/local/lib/antlr-4.8-complete.jar:$CLASSPATH"

export NPM_PACKAGES="/Users/alexperez\ 1/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

export LC_CTYPE=C 
export LANG=C
 
#set the terminal prompt
export PS1="\[\e[0;32m\][\w]\n\[\e[0;37m\]\$"

#vi edit mode
set -o vi

# expand aliases for SSH and the like
shopt -s expand_aliases

#pass through <C-s> without the terminal halting input
bind -r '\C-s'
stty -ixon

#simple bookmarking
function bookmarklist {
    i=0
    while ((i++)); read -r line; do
        echo "$i: $line"
    done < ~/.bookmarks
}
function bookmarkopen() {
    line=$(sed -n "$1p" < ~/.bookmarks)
    cd $line
}
function bookmarkpop() {
    line=$(sed -n "$1p" < ~/.bookmarks)
    sed -i "" "$1d" ~/.bookmarks
    cd $line
}
function bookmarkdelete() {
    sed -i "" "$1d" ~/.bookmarks
}

# bookmark-related
alias ba="pwd >> ~/.bookmarks"
alias bl="bookmarklist"
alias bo="bookmarkopen"
alias bp="bookmarkpop"
alias bd="bookmarkdelete"

alias ls="gls --group-directories-first"
alias l='ls -lhG'
alias la='l -a'
alias c='clear'
alias cl='clear;la'
alias p='pwd'

alias v='vim'

alias src="source ~/.bashrc"

alias tmux="TERM=screen-256color tmux"
alias td='tmux a -t d || tmux new -n d'
alias tls='tmux ls'
alias ta='tmux attach -t'
alias tn='tmux new -s'

# git command shortcuts
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias gl='git log'
alias gm='git merge'
alias gs='git status'
alias grm='git rm --cached'
alias gg='git grep -n'
alias gcom='git checkout master'
alias gst='git stash'
alias gsp='git stash pop'
alias gbld='git for-each-ref --sort=committerdate refs/heads'
alias gbc='git rev-parse --abbrev-ref HEAD'
alias gpsc='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gcam="gc -am"
alias gcob='gco -b'
alias gpsm='git push origin master'
alias gpum='git pull origin master'
alias gpspm='git push production master'
alias gob='gb | fzf | xargs git checkout'

#bookmark current branch
alias scb='echo `git rev-parse --abbrev-ref HEAD` > /tmp/scb'
alias gcoc='gco `cat /tmp/scb`'

function gacs { 
    ga $1
    gc -m "$2"
}

alias edhosts='sudo vim /etc/hosts'

# bulk toggle leading # in /etc/hosts 
# my online vices are there
tprod() {
  # in-file state/label
  local ON='productivity_on'
  local OFF='productivity_off'

  if grep -q $OFF /etc/hosts; then
    sudo sed -i '' 's/^#//' /etc/hosts # remove the leading #
    sudo sed -i '' "s/$OFF/#$ON/" /etc/hosts # update the state/label (and add missing # after trim to the label)
    echo "on"
  elif grep -q $ON /etc/hosts; then
    sudo sed -i '' "s/#$ON/$OFF/" /etc/hosts # update the state/label
    sudo sed -i '' "s/^/#/" /etc/hosts # add the leading #
    echo "off"
  fi
}

alias hisgrep='history | grep'
alias chrome='open -a "Google Chrome"'
alias fnr="while true ; do clear; node server.js || terminal-notifier -message \"Node crashed\" ; done"
alias bsync='browser-sync start --server --files="*.html, js/*.js, css/*.css"'

# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
alias dbh="ssh existcreate@devbrainhack.co"
alias mcraft="ssh existcreate@45.55.245.49"

export NVM_DIR="/Users/alexperez/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
alias psgrep='ps aux | grep '

# canvs-related
alias canvsdb='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/new_id_rsa -L27018:localhost:27017 ubuntu@ec2-54-87-50-176.compute-1.amazonaws.com'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias crn="npx cypress run --config video=false"
alias tm="terminal-notifier -message"
alias sync="git fetch upstream test && git reset --hard upstream/test"
alias movies="node future_releases.js ; while true; do terminal-notifier -message 'CHECK ME' ; done"
alias moviesfuture="node future_releases.js --future ; while true; do terminal-notifier -message 'CHECK ME' ; done"
alias gsl="git stash list"
alias gsa="git stash apply"
alias xargs="xargs "
alias ass='gsl | fzf | awk "{print }" | sed "s/://" | xargs gsa' # TODO: wtf how to escape correctly

# antlr
alias antlr='java -jar /usr/local/lib/antlr-4.8-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'
