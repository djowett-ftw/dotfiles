autoload -U colors && colors

setopt PROMPT_SUBST
PS1='%{$fg[red]%}%3~%{$reset_color%}$(~/scm_prompt zsh)%{$reset_color%}\$ '
RPROMPT='%{$fg[green]%}%n@%m%{$reset_color%}'

source ~/.allrc
alias ../..='cd ../..'
alias ../../..='cd ../../..'
