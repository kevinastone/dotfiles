" Load a local pre override
if !empty(glob("$HOME/.vimrc.pre"))
    source $HOME/.vimrc.pre
endif

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
set laststatus=2                " always show status line

set switchbuf=newtab            " Prefer tabs to split windows

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
set shiftround

set autoindent                  " Keep indentation from previous line

" Shortcut to clear search highlight
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin indent on

set listchars=tab:»·,trail:·,eol:¬


" ================ Wrapping =======================

set wrap                        " Wrap lines
set linebreak                   " Wrap lines at convenient points
" saner up/down movement (screen-wise, not line-wise)
nmap j gj
nmap k gk
map <down> j
map <up> k


" ================ Completion =======================

set wildmode=list:longest
set wildmenu                    " enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     " stuff to ignore when tab completing
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* 
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

" ================ Plugins ==============

silent! if plug#begin('~/.vim/plugged')

" == Theme ==
Plug 'wellsjo/wellsokai.vim'

" == Fuzzy Searching ==
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" == Sidebar ==
Plug 'scrooloose/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

" == Comments ==
Plug 'tomtom/tcomment_vim'

" == Multiple Cursors ==
Plug 'terryma/vim-multiple-cursors'

" == Editing ==
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion'
Plug 'mattn/emmet-vim'
if v:version >= 704
    Plug 'SirVer/ultisnips'
endif

" == Version Control ==
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'ludovicchabant/vim-lawrencium'

" == Whitespace ==
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=236

" == Linting ==

Plug 'scrooloose/syntastic'
Plug 'chrisbra/vim-show-whitespace'

" == Autocompletion ==
if v:version >= 703 && has('patch598')
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py', 'for': ['python', 'c', 'cpp'] }
    autocmd! User YouCompleteMe call youcompleteme#Enable()
endif
" XML/HTML
Plug 'sukima/xmledit', { 'do': 'make' }

" == Editorconfig ==
Plug 'editorconfig/editorconfig-vim'

" == Status Bar ==
Plug 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1

" == Languages ==
Plug 'honza/dockerfile.vim'
Plug 'dag/vim-fish'
Plug 'solarnz/thrift.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'hhvm/vim-hack'
let g:hack#omnifunc=1
autocmd BufNewFile,BufRead *.php setl omnifunc=hackcomplete#Complete

call plug#end()
endif


" ================ Shortcuts ==============
" Tabs
" noremap <silent> <C-[> :bprevious<CR>
" noremap <silent> <C-]> :bnext<CR>
" Whitespace
nmap <silent> <leader>a :set nolist!<CR>
" Wrapping

" Commenting
" nmap <C-m> gcc
" vmap <C-m> gc
" Fuzzy
map <C-p> :FZF<CR>
" Autocompletion
nmap <leader>d :YcmCompleter GoToDefinition<CR>
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
" Save
inoremap <C-s>     <C-O>:update<cr>
nnoremap <C-s>     :update<cr>
nnoremap <leader>s :update<cr>
nnoremap <leader>w :update<cr>
" Quit
inoremap <C-Q>     <esc>:q<cr>
nnoremap <C-Q>     :q<cr>
vnoremap <C-Q>     <esc>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>
" Window Navigation
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
" NERDTree
map <leader>b :NERDTreeToggle<CR>
map <leader>s :NERDTreeFind<CR>

" ================ Theme ==============
silent! colorscheme wellsokai
silent! let g:airline_theme="molokai"


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
