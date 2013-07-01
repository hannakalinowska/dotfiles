#! /bin/sh

path=`pwd`
cp "$path/.ackrc" ~/.ackrc
#ln -s "$path/.ackrc" ~/.ackrc
cp "$path/.ctags" ~/.ctags
#ln -s "$path/.ctags" ~/.ctags
cp "$path/.inputrc" ~/.inputrc

ln -s "$path/.gitconfig" ~/.gitconfig
ln -s "$path/.gitignore" ~/.gitignore

ln -s "$path/.gvimrc" ~/.gvimrc
ln -s "$path/.vimrc" ~/.vimrc
ln -s "$path/.tmux.conf" ~/.tmux.conf

ln -s "$path/.vim/snippets" ~/.vim/snippets
