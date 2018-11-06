
c() {
    cd ~/projects/$1;
}

pwdcp() {
    echo -n `pwd | sed 's/ /\\\\ /g'`/$1 | pbcopy
}

. $ZSH_CUSTOM/plugins/jone/lazy-nvm.zsh
. $ZSH_CUSTOM/plugins/jone/rdot.zsh
