# TODO: install homebrew
brew install rbenv tmux

rbenv install 2.5.1 && rbenv init
rbenv local 2.5.1
gem install bundler

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

brew install hub jq ack ctags
brew install tree pstree

brew tap caskroom/fonts
brew cask install font-fira-code
