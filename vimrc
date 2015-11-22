set nocompatible

syntax on
filetype plugin indent on
set autoindent                  "Keep indentation from previous line
set smartindent                 "Automatically inserts indentation in some cases

" Prefer spaces over tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
 
set wildmenu                    " visual autocomplete for command menu

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats

set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

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
Plug 'junegunn/vim-easy-align'

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
let g:airline_theme="molokai"
let g:airline#extensions#tabline#enabled = 1

if !empty(glob("$HOME/.vimrc_local"))
    source $HOME/.vimrc_local
endif

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
        \ 'fallback': 'cd %s && ag -l'
        \ }
endif

if executable('pt')
    let g:ackprg = 'pt --nogroup --nocolor'

    let g:ctrlp_user_command = {
        \ 'types': {
          \ 1: ['.git', 'cd %s && git ls-files'],
          \ 2: ['.hg', 'hg --cwd %s locate -I .'],
          \ },
        \ 'fallback': 'cd %s && pt -l *'
        \ }
endif
