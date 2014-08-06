install:
	cp "$(CURDIR)/.ackrc" ~/.ackrc
	cp "$(CURDIR)/.ctags" ~/.ctags
	cp "$(CURDIR)/.inputrc" ~/.inputrc
	ln -s "$(CURDIR)/.gitconfig" ~/.gitconfig
	ln -s "$(CURDIR)/.gitignore" ~/.gitignore
	ln -s "$(CURDIR)/.gvimrc" ~/.gvimrc
	ln -s "$(CURDIR)/.vimrc" ~/.vimrc
	ln -s "$(CURDIR)/.tmux.conf" ~/.tmux.conf
	ln -s "$(CURDIR)/.tmuxinator" ~/.tmuxinator
	ln -s "$(CURDIR)/.vim/snippets" ~/.vim/snippets

clean:
	rm -f ~/.vim/snippets
	rm -f ~/.tmuxinator
	rm -f ~/.tmux.conf
	rm -f ~/.vimrc
	rm -f ~/.gvimrc
	rm -f ~/.gitignore
	rm -f ~/.gitconfig
	rm -f ~/.inputrc
	rm -f ~/.ctags
	rm -f ~/.ackrc
