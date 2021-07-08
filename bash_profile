export HISTSIZE=5000
export HISTFILESIZE=50000
# Path
export PATH=$PATH:$HOME/bin

# Git command completion
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  . /usr/local/etc/bash_completion.d/git-completion.bash
fi

# Git command prompt
function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
prompt_cmd () {
    PS1="${PYTHON_VIRTUALENV}$NO_COLOUR\u@\h:[\W]${B_STATE}\$(parse_git_branch)$NO_COLOUR\$ "
}

PROMPT_COMMAND=prompt_cmd

# PloneCLI / bobtemplates
. /Users/danieljowett/development/tools/plonecli/bin/plonecli_autocomplete.sh

# Python - blame nicku
export PYTHONDONTWRITEBYTECODE=1  # Python won’t try to write .pyc or .pyo files on the import of source modules
export PYTHONUNBUFFERED=1  # Force stdin, stdout and stderr to be totally unbuffered.
export VIRTUAL_ENV_DISABLE_PROMPT=1  # Disable default virtualenv prompt

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1  # Do not update on installation in homebrew

# Lang
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# OpenSSL
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


# For compilers to find readline you may need to set:
export LDFLAGS="$LDFLAGS -L/usr/local/opt/readline/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/readline/include"

# For pkg-config to find readline you may need to set:
#export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# For compilers to find zlib you may need to set:
export LDFLAGS="$LDFLAGS -L/usr/local/opt/zlib/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/zlib/include"

# For pkg-config to find zlib you may need to set:
#export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig"

# mysql-client@5.7
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
export LDFLAGS="$LDFLAGS -L/usr/local/opt/mysql-client@5.7/lib"
export CPPFLAGS="$CPPFLAGS -I/usr/local/opt/mysql-client@5.7/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/mysql-client@5.7/lib/pkgconfig"

alias vimba="vim ~/.bash_profile"

# Git related
# -----
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gbav="git branch -avv --sort=committerdate"
alias gf="git fetch"
alias gco="git checkout"
alias gcom="git checkout master"
alias gpuff="git pull --ff-only"
alias gss="git stash save"
alias gsp="git stash pop"
alias gsdrop="git stash drop"
alias gam="git commit --amend"
#alias gga="git grep <regexp> $(git rev-list --all)"
alias gga="git rev-list --all | xargs git grep"
#alias gpoh="git push -u origin HEAD"
alias gpoh="[ \$(git rev-parse --abbrev-ref HEAD) == 'master' ] && echo -e '\nThe gitmaster strikes again\!\n' || git push origin -u HEAD"
#alias gfpoh="git push --force origin HEAD"
alias gfpoh="[ \$(git rev-parse --abbrev-ref HEAD) == 'master' ] && echo -e '\nThe gitmaster strikes again\!\n' || git push origin --force HEAD"
# grep every tag. Nicer piped thru sort -V (version sort)
alias ggt="echo \$(git tag -l) | xargs git grep"

#Editor and searching
# -----
alias xs="xargs subl"
alias xc="xargs charm"
# With line numbers (needs agn)
alias xcl='cut -f1-2 -d: | xargs charm'
alias agn='ag --nogroup'
# Use xargs here just to reorder the arguments. Note that src is not in the omelette
alias agom="echo parts/omelette/ src/ | xargs ag --follow "
#alias agomd     .... see functions
alias lnb="echo /Users/danieljowett/bin | xargs -n1 -I{} ln -s \$PWD/{} ; ls /Users/danieljowett/bin"

# Plone / buildout specific
# -----
alias bbii="bin/buildout install instance"
alias bifg="bin/instance fg"
alias cplb="cp ~/development/templates/local-buildout.cfg ."

# (change) directory shortcuts
# -----
alias cde="cd $HOME/development/eggdev/"
alias cdp="cd $HOME/development/projects/"
alias cdt="cd $HOME/development/tools/"
alias cdc="cd $HOME/development/plone-core/"
alias cdd="cd $HOME/development/zopedbs/"

## Functions
function agomd () { 
  ag --follow -A4 "(class|def) *${1}\W" parts/omelette/ src/; 
}
