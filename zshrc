#!/bin/zsh

export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export EDITOR=/usr/local/bin/emacsclient
export ALTERNATE_EDITOR=vim
export FIGNORE=".egg-info:.pyc:.pyo:.mo"
export GEVER_CACHE_TEST_DB=true
export PIPENV_VENV_IN_PROJECT=1
export PYENV_ROOT=${HOME}/.pyenv
export PYTHON27=/Users/jone/.pyenv/versions/2.7.15/bin/python
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export GPG_TTY=`tty`

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
alias fakemail='sudo ~/.bin/fakemail.py --host=localhost --port=25 --path=$HOME/temp/mails --background --open'

if [[ `uname` == "Darwin" ]]; then
    PROMPT="%{$fg[green]%}%m ${PROMPT}"
else
    PROMPT="%{$fg_bold[red]%}%m ${PROMPT}"
fi

# git
alias ga.='ga .'
alias gb='git branch -v'
alias grs='git reset --hard'
alias gs='git status'
alias go='git browse'
alias glog='git log --graph'
alias gpp='git push-to-pr'

if [ -x "$(command -v rbenv)" ]; then eval "$(rbenv init -)"; fi
if [ -x "$(command -v pyenv)" ]; then eval "$(pyenv init -)"; fi

# Virtualenv-init is very slow and only adds the activate-on-cd-feature.
# if [ -x "$(command -v pyenv-virtualenv-init)" ]; then eval "$(pyenv virtualenv-init -)"; fi

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
    export NVM_DIR="$HOME/.nvm"
    . "/usr/local/opt/nvm/nvm.sh" --no-use
fi

# tramp support on remote server
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

if [[ `uname` == "Darwin" ]]; then
    #### HOMEBREW
    # include SDK headers
    export CPATH=`xcrun --show-sdk-path`/usr/include

    # zlib
    export LDFLAGS="-L/usr/local/opt/zlib/lib $LDFLAGS"
    export CPPFLAGS="-I/usr/local/opt/zlib/include $CPPFLAGS"
    export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig $PKG_CONFIG_PATH"

    # sqlite
    export PATH="/usr/local/opt/sqlite/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/sqlite/lib $LDFLAGS"
    export CPPFLAGS="-I/usr/local/opt/sqlite/include $CPPFLAGS"
    export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig $PKG_CONFIG_PATH"

    # openssl
    export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/openssl/lib $LDFLAGS"
    export CPPFLAGS="-I/usr/local/opt/openssl/include $CPPFLAGS"
    export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig $PKG_CONFIG_PATH"
    export DYLD_LIBRARY_PATH="/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH"

    # postgresql@11
    export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/postgresql@10/lib $LDFLAGS"
    export CPPFLAGS="-I/usr/local/opt/postgresql@10/include $CPPFLAGS"
    export PKG_CONFIG_PATH="/usr/local/opt/postgresql@10/lib/pkgconfig $PKG_CONFIG_PATH"

    #### MacOS
    export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include/sasl $CFLAGS"
fi


export PATH=$HOME/bin:$HOME/.bin:$PATH
