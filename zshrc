#!/bin/zsh

export PATH=$HOME/bin:$HOME/.bin:/usr/local/bin:$PATH
export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=/usr/local/bin/emacsclient
export ALTERNATE_EDITOR=vim
export PYTHONSTARTUP=~/.pythonstartup
export FIGNORE=".egg-info:.pyc:.pyo:.mo"

ZSH_THEME="robbyrussell"
ZSH_CUSTOM=$HOME/.zsh
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
    django
    git
    jone
)

source $ZSH/oh-my-zsh.sh

alias pg='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log -m fast'
alias e='$EDITOR -n'
alias d='mvimdiff'
alias fakemail='sudo /usr/bin/python2.6 ~/bin/fakemail.py --host=localhost --port=25 --path=$HOME/temp/mails --background --open'

# git
alias ga.='ga .'
alias gb='git branch -v'
alias grs='git reset --hard'
alias gs='git status'
alias go='git browse'

if [ -x "$(command -v rbenv)" ]; then eval "$(rbenv init -)"; fi
if [ -x "$(command -v pyenv)" ]; then eval "$(pyenv init -)"; fi
if [ -x "$(command -v pyenv-virtualenv-init)" ]; then eval "$(pyenv virtualenv-init -)"; fi
