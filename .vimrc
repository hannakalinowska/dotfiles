" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" ustawia wielkość tabulacji na X
set expandtab ts=2 sw=2

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
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-vividchalk'
Bundle 'git://github.com/jeroenp/vim-xquery-syntax.git'
Bundle 'mudge/runspec.vim'



" włącza numerowanie wierszy
" set number

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
colorscheme railscasts
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set enc=utf-8

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


" previous tab
map gv :tabp<CR>

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
"set gfn=Inconsolata\ 12
set gfn=Monaco:h13
"
"" FuzzyFinder keybinding
nnoremap <leader>fb :FufBuffer<CR>
nnoremap <leader>fd :FufDir<CR>
nnoremap <leader>fD :FufDir <C-r>=expand('%:~:.:h').'/'<CR><CR>
nmap <leader>Fd <leader>fD
nmap <leader>FD <leader>fD
nnoremap <leader>ff :FufFile **/<CR>
nnoremap <leader>fF :FufFile <C-r>=expand('%:~:.:h').'/'<CR><CR>
nmap <leader>FF <leader>fF
nnoremap <leader>ft :FufTextMate<CR>
nnoremap <leader>fr :FufRenewCache<CR>
nnoremap <C-f> <leader>ff
"nnoremap <C-t> :<C-u>FufFile **/<CR>
nnoremap <C-b> :FufBuffer<CR>
"let g:FuzzyFinderOptions = {}
"let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{},
   "\                      'MruFile':{}, 'MruCmd':{}, 'Bookmark':{},
   "\                      'Tag':{}, 'TaggedFile':{},
   "\                      'GivenFile':{}, 'GivenDir':{}, 'GivenCmd':{},
   "\                      'CallbackFile':{}, 'CallbackItem':{}, }
let g:fuf_onelinebuf_location  = 'botright'
let g:fuf_maxMenuWidth     = 300
let g:fuf_file_exclude     = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)|\.pyo|\.pyc|autom4te\.cache|blib|_build|\.bzr|\.cdv|cover_db|CVS|_darcs|\~\.dep|\~\.dot|\.git|\.hg|\~\.nib|\.pc|\~\.plst|RCS|SCCS|_sgbak|\.svn'

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" taglist plugin
" sort methods alphabetically
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
nnoremap <leader>af :AckFromSearch
xnoremap <leader>t :Tabularize /<Bar>/<CR>

" split windows changes
" (vertical -> horizontal, horizontal -> vertical)
nnoremap <leader>vh <C-w>t<C-w>K
nnoremap <leader>hv <C-w>t<C-w>H

" Gundo
nnoremap <leader>g :GundoToggle<CR>

" fold block - works best with matchit plugin
nnoremap <leader>z nzf%

" syntax highlighting for .feature files
au Bufread,BufNewFile *.feature set filetype=cucumber

" Command-T settings
set wildignore+=.hg/**,.git/**,external/**,log/**,tmp/**,.*.swp,*.jpg,*.gif,*.png
set wildignore+=*.fdt,*.fdx,*.fnm,*.frq,*.nrm,*.prx,*.tii,*.tis " solr data files
set wildignore+=public/naturejobs/**,public/science/** " naturejobs asset symlinks


" CamelCaseMotion mappings
"nmap w <Plug>CamelCaseMotion_w
"nmap b <Plug>CamelCaseMotion_b
"nmap e <Plug>CamelCaseMotion_e

" show whitespace characters
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list

set laststatus=2 "always show status bar

set linespace=4

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" remap <F1>
map <F1> <Esc>
imap <F1> <Esc>

" random useful remaps
map <S-Enter> o<Esc>
nnoremap <leader>b :BufExplorer<CR>

cd ~/github/jobs

function! RunSpec()
  let current_file = expand('%')
  write

  if match(current_file, '_spec\.rb$') != -1
    exec ':!bundle exec spec ' . current_file
  else
    let spec_file = substitute(current_file, '\.rb$', '_spec.rb', '')

    " Remove app/ for Rails apps.
    if match(current_file, '^app/') != -1
      let spec_file = substitute(spec_file, '^app/', '', '')
    endif

    exec ':!bundle exec spec --no-color spec/' . spec_file
  endif
endfunction
nmap <leader>R :call RunSpec()<CR>
nmap <leader>r :exe "!bundle exec spec %\:" . line(".")<cr>
