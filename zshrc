export SHELL=/bin/zsh
source ~/.zsh/config
source ~/.zsh/aliases
source ~/.zsh/completion
source ~/.zsh/gpg

# include ~/.zshlocal if existing:
if [[ -s ~/.zshlocal ]] ; then source ~/.zshlocal ; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Library/TeX/texbin:$PATH"

# use correct openssl lib
export CPPFLAGS="${CPPFLAGS} -I$(brew --prefix openssl)/include"
export LDFLAGS="${LDFLAGS} -L$(brew --prefix openssl)/lib"

eval "$(rbenv init -)"
eval "$(pyenv init -)"
