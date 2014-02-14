source ~/.zsh/config
source ~/.zsh/aliases
source ~/.zsh/completion

# include ~/.zshlocal if existing:
if [[ -s ~/.zshlocal ]] ; then source ~/.zshlocal ; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(rbenv init -)"
