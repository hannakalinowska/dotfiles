
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias be='bundle exec'
alias ls='ls -G'
alias grep='grep --color=auto'
alias vi='vim'
alias tmux='TERM=screen-256color-bce tmux'
alias mk='make -f ~/Makefile'
alias ssh='TERM=ansi ssh'
alias rubocop='rubocop --display-style-guide --extra-details --display-cop-names'

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
