" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'mileszs/ack.vim'
Plugin 'corntrace/bufexplorer'
Plugin 'Raimondi/delimitMate'
Plugin 'sjl/gundo.vim'
Plugin 'matchit.zip'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'msanders/snipmate.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-abolish'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-tbone'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'

" Syntax plugins
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-haml'
Plugin 'puppetlabs/puppet-syntax-vim'
Plugin 'jeroenp/vim-xquery-syntax'
Plugin 'vim-scala'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jimmyhchan/dustjs.vim'
Plugin 'tpope/vim-jdaddy'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

syntax enable
set background=light
colorscheme solarized
set t_Co=256                        " force vim to use 256 colors
let g:solarized_termcolors=256      " use solarized 256 fallback

set enc=utf-8
"set term=ansi " make numpad work in terminal in OSX
set term=xterm-256color

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" set tabs to 2 spaces
set tabstop=2
set smarttab
set shiftwidth=2
set expandtab

set nobackup
set number
let mapleader = ","

nnoremap <leader><Space> :noh<CR>

" nicer font
if has("gui_macvim")
  set guifont=Monaco:h13
else
  set guifont=Inconsolata\ 12
endif

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>a :Ack!
nnoremap <leader>aa :AckFromSearch!

noremap <C-a> ^
noremap <C-e> $

" split windows changes
set splitright splitbelow
" (vertical -> horizontal, horizontal -> vertical)
nnoremap <leader>vh <C-w>t<C-w>K
nnoremap <leader>hv <C-w>t<C-w>H

" maximise current split window
nnoremap <leader>WM <C-w>_<C-w><Bar>
" make windows evenly spaced
nnoremap <leader>wm <C-w>=

" Gundo
nnoremap <leader>g :GundoToggle<CR>

" fold block - works best with matchit plugin
nnoremap <leader>z zf%

" no sudo fix
cnoremap w!! %!sudo tee > /dev/null %

" syntax highlighting
au Bufread,BufNewFile *.feature set filetype=cucumber
au Bufread,BufNewFile Gemfile,Gemfile.lock,Procfile,Rakefile set filetype=ruby
au BufRead,BufNewFile *.pp set filetype=puppet
au BufRead */puppet-modules/*/nodes.pp.npgutil set filetype=puppet
au BufRead,BufNewFile *.json set filetype=javascript

au BufRead,BufNewFile */shunter-laserwolf/*,*/shunter-proxy/* set noexpandtab

" Toggle between relative and absolute line numbers
nnoremap <leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if &number
    set relativenumber
  else
    set number
  endif
endfunction

" Command-T settings
set wildignore+=.hg/**,.git/**,external/**,log/**,tmp/**,.*.swp,*.jpg,*.gif,*.png
set wildignore+=solr/data/**,solr/conf/**,*.fdt,*.fdx,*.fnm,*.frq,*.nrm,*.prx,*.tii,*.tis " solr data files
set wildignore+=public/naturejobs/**,public/science/** " naturejobs asset symlinks
set wildignore+=*.obo,*.nt
set wildignore+=vcr_cassettes/**
set wildignore+=coverage/**

" show whitespace characters
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list

set laststatus=2 "always show status bar

set linespace=4

" highlight current line
set cursorline
set colorcolumn=80

" remap <F1>
map <F1> <Esc>
imap <F1> <Esc>

" remove right and left scrollbars
set guioptions-=r
set guioptions-=L
" remove menu
set guioptions-=T

set wildmode=longest,list,full
set wildmenu

" random useful remaps
nmap <S-Enter> o<Esc>
nnoremap <leader>b :BufExplorer<CR>

" remap %% to be the path to the current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" window movements
map <leader><Up> :TmuxNavigateUp<CR>
map <leader><Down> :TmuxNavigateDown<CR>
map <leader><Left> :TmuxNavigateLeft<CR>
map <leader><Right> :TmuxNavigateRight<CR>
map <leader>k :TmuxNavigateUp<CR>
map <leader>j :TmuxNavigateDown<CR>
map <leader>h :TmuxNavigateLeft<CR>
map <leader>l :TmuxNavigateRigh<CRt>

nmap <leader>e :Explore
nmap <leader>v :Vexplore
nmap <leader>s :Sexplore

nmap <leader>t :TagbarToggle<CR>

" syntastic ruby
let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'
