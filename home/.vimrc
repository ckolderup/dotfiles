set ruler
set backspace=indent,eol,start
set tabstop=2
set hidden
set smartindent
set expandtab
set shiftwidth=2
filetype indent on
filetype plugin on
syntax on

set incsearch
set hlsearch
set wildmenu
set wildmode=list:full
set smartcase

nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <leader>n :silent :nohlsearch<CR>
set listchars=tab:>-,trail:·,eol:$
set showbreak=.

set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

set numberwidth=5
set number

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^

colorscheme molokai
