" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'mileszs/ack.vim'
Bundle 'corntrace/bufexplorer'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'hallettj/jslint.vim'
Bundle 'matchit.zip'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'taglist.vim'
Bundle 'tpope/vim-abolish'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-cucumber'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'git://github.com/jeroenp/vim-xquery-syntax.git'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'vim-scala'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mudge/runspec.vim'
Bundle 'jimmyhchan/dustjs.vim'
Bundle 'tpope/vim-dispatch'

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

" taglist plugin
let Tlist_Sort_Type = "name"
let Tlist_Auto_Open = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_Menu = 1
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <C-c> :<C-u>Tlist<CR>

" autoclose
nmap <leader>x <Plug>ToggleAutoCloseMappings

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

nnoremap <leader>f :CommandTFlush<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <C-t> :CommandT<CR>
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

" syntax highlighting for .feature files
au Bufread,BufNewFile *.feature set filetype=cucumber
au Bufread,BufNewFile Gemfile,Gemfile.lock,Procfile,Rakefile set filetype=ruby
au BufRead,BufNewFile *.pp set filetype=puppet

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

" show whitespace characters
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list

set laststatus=2 "always show status bar

set linespace=4

" highlight current line
set cursorline

" remap <F1>
map <F1> <Esc>
imap <F1> <Esc>

" remove right and left scrollbars
set guioptions-=r
set guioptions-=L
" remove menu
set guioptions-=T

set wildmenu

" random useful remaps
map <S-Enter> o<Esc>
nnoremap <leader>b :BufExplorer<CR>

" remap %% to be the path to the current file
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set wildmenu

" window movements
map <leader><Up> <C-w><Up>
map <leader><Down> <C-w><Down>
map <leader><Left> <C-w><Left>
map <leader><Right> <C-w><Right>
map <leader>k <C-w><Up>
map <leader>j <C-w><Down>
map <leader>h <C-w><Left>
map <leader>l <C-w><Right>

" syntastic ruby
let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'
