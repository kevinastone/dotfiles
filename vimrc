set nocompatible

syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","


" ================ General Config ====================

set noerrorbells                " No beeps
set number                      " Show line numbers
set ruler                       " Show cursor position
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set autoread                    " Reload files changed outside vim

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden


" ================ Indentation =======================

" Prefer spaces over tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set autoindent                  " Keep indentation from previous line

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin indent on

set nowrap                      " Don't wrap lines
set linebreak                   " Wrap lines at convenient points

set listchars=tab:»·,trail:·,eol:¬
nmap <silent> <leader>a :set nolist!<CR>

 
" ================ Completion =======================

set wildmode=list:longest
set wildmenu                    " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif


" ================ Scrolling ========================

set scrolloff=8                 " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Search ===========================

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

set shell=/bin/sh

call plug#begin('~/.vim/plugged')

" Fuzzy Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" Awesomebar
Plug 'kien/ctrlp.vim'

" Sidebar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Comments
Plug 'tomtom/tcomment_vim'

" Multiple Cursors
Plug 'terryma/vim-multiple-cursors'

" Editing
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Status Bar
Plug 'bling/vim-airline'

" Whitespace
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=236

" Linting

Plug 'scrooloose/syntastic'

Plug 'chrisbra/vim-show-whitespace'

" Autocompletion
if v:version >= 703598
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
    autocmd! User YouCompleteMe call youcompleteme#Enable()
endif

" Theme
Plug 'tomasr/molokai'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Theme
colorscheme molokai

" Use airline!!!
let g:airline_theme=" molokai"
let g:airline#extensions#tabline#enabled = 1

" Searching

let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'find %s -type f'
    \ }

if executable('ag')
    let g:ackprg = 'ag --vimgrep'

    let g:ctrlp_user_command = {
        \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
          \ },
        \ 'fallback': 'cd %s && ag -l --nocolor'
        \ }
endif

if executable('pt')
    let g:ackprg = 'pt --nogroup --nocolor'

    let g:ctrlp_user_command = {
        \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
          \ },
        \ 'fallback': 'cd %s && pt -l --nocolor *'
        \ }
endif


" Load a local override
if !empty(glob("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
