
c() {
    cd ~/projects/$1;
}

pwdcp() {
    echo -n `pwd | sed 's/ /\\\\ /g'`/$1 | pbcopy
}

g4c() {
    set -x
    git clone git@github.com:4teamwork/$@
}

. $ZSH_CUSTOM/plugins/jone/lazy-nvm.zsh
. $ZSH_CUSTOM/plugins/jone/rdot.zsh
