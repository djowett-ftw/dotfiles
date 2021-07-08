# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/danieljowett/.oh-my-zsh"
## Zsh customizations
# Stop git diff (and prob others) from needlessly paging
export LESS="FRX"
export GIT_PAGER="less"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "juanghurtado" "wedisagree" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    django
    git
)
source $ZSH/oh-my-zsh.sh

# From Jonas
export FIGNORE=".egg-info:.pyc:.pyo:.mo"


if [ -x "$(command -v rbenv)" ]; then eval "$(rbenv init -)"; fi
if [ -x "$(command -v pyenv)" ]; then eval "$(pyenv init -)"; fi

# Virtualenv-init is very slow and only adds the activate-on-cd-feature.
# if [ -x "$(command -v pyenv-virtualenv-init)" ]; then eval "$(pyenv virtualenv-init -)"; fi

# From Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# From Jonas continues...

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

    # postgresql@11 - J uses 10, I used 11 (or perhaps 12, but prob 11), Cl uses 13
    export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
    export LDFLAGS="-L/usr/local/opt/postgresql@11/lib $LDFLAGS"
    export CPPFLAGS="-I/usr/local/opt/postgresql@11/include $CPPFLAGS"
    export PKG_CONFIG_PATH="/usr/local/opt/postgresql@11/lib/pkgconfig $PKG_CONFIG_PATH"

    #### MacOS
    export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include/sasl $CFLAGS"
fi


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#alias vimba="vim ~/.bash_profile"
alias vimba="echo 'you mean vimza';vim ~/.zshrc"
alias vimza="vim ~/.zshrc"
alias portsinuse="sudo lsof -i -n -P | grep TCP"

# Git related
# -----
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdm="git diff master"
alias gdms="git diff master --stat"
alias gbav="git branch -avv --sort=committerdate"
alias gblv="git branch -lvv --sort=committerdate"
alias mybr="git branch -l | grep dj"
alias gf="git fetch"
alias gco="git checkout"
#alias gcom="git checkout master"
alias gcom="echo 'use gcm instead so that gcol works :-)'"
alias gcol="r gco"
alias gpuff="git pull --ff-only"
alias gss="git stash save"
alias gsp="git stash pop"
alias gsdrop="git stash drop"
alias gam="git commit --amend"
#alias gga="git grep <regexp> $(git rev-list --all)"
alias gga="git rev-list --all | xargs git grep"
#alias gpoh="git push -u origin HEAD"
alias gpoh="[[ \$(git rev-parse --abbrev-ref HEAD) == 'master' ]] && echo -e '\nThe gitmaster strikes again\!\n' || git push origin -u HEAD"
#alias gfpoh="git push --force origin HEAD"
alias gfpoh="[[ \$(git rev-parse --abbrev-ref HEAD) == 'master' ]] && echo -e '\nThe gitmaster strikes again\!\n' || git push origin --force HEAD"
# grep every tag. Nicer piped thru sort -V (version sort)
alias ggt="echo \$(git tag -l) | xargs git grep"
# Git Branch List Me
alias gblm="git branch -l 'dj*' | nl -w2"
alias gscp="git am --show-current-patch"
alias gdo="git diff origin/\$(git rev-parse --abbrev-ref HEAD)"
alias gssv="git stash show -v"
alias glog='git log --graph'

#Editor and searching
# -----
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
alias pibo="grep -hE '^zc.buildout|^setuptools' *.cfg | sed 'sz = z==z' | xargs bin/pip install"
alias pibo1="bin/pip install setuptools==44.1.1 zc.buildout==2.13.3 ; grep -hE '^zc.buildout|^setuptools' *.cfg | sed 'sz = z==z' | xargs bin/pip install"
alias cpbo="cp -v ~/development/templates/local-buildout.cfg .; ln -sv local-buildout.cfg buildout.cfg"

# (change) directory shortcuts
# -----
alias cde="cd $HOME/development/eggdev/"
alias cdp="cd $HOME/development/ogb-projects/"
alias cdt="cd $HOME/development/tools/"
alias cdc="cd $HOME/development/plone-core/"
alias cdz="cd $HOME/development/zopedbs/"
alias cdd="cd $HOME/development/django/"

# Django stuff
# -----
alias act=". venv/bin/activate"

## Functions
function agomd () { 
  ag --follow -A4 "(class|def) *${1}\W" parts/omelette/ src/; 
}

function gbdone () { 
  git branch -m ${1} DONE/${1##dj/}
}

function gbold () { 
  git branch -m ${1} OLD/${1##dj/}
}

# sed command finds nth line and strips out '* ' if it is there
function gcon () {
  git checkout $(git branch -l "dj/*" | sed -n "$1s/^..//p")
}
