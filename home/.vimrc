call pathogen#helptags()
call pathogen#infect()

set ruler
set t_Co=256
set background=dark
colorscheme molokai
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
set wildignore+=*.o,*.obj,*.class,*.jar
set smartcase

imap jj <Esc>
nmap <silent> <leader>s :set nolist!<CR>
nmap <silent> <Space> :silent nohlsearch<CR>
nmap <silent> <leader>t :CtrlP<CR>
nmap <silent> <leader>b :CtrlPBuffer<CR>

set list
set listchars=trail:·
set showbreak=.

set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]
set laststatus=2
let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'

set numberwidth=5
set number

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"json is javascript, so, uh, just use that
autocmd BufNewFile,BufRead *.json set ft=javascript
"same with Gemfile always being ruby
autocmd BufNewFile,BufRead Gemfile set ft=ruby

"let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

if &term == "screen"
  set t_kN=^[[6;*~
  set t_kP=^[[5;*~
endif

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

nmap <silent> <F2> :!/Applications/Shoes.app/Contents/MacOS/shoes %:p<CR><CR>
nmap <silent> <F3> :!/Applications/love.app/Contents/MacOS/love %:p:h<CR><CR>
nnoremap <leader>f :Ack 

if has('persistent_undo')
  set undofile "so is persistent undo ...
  set undolevels=1000 "maximum changes to undone
  set undoreload=10000 "maximum number lines to save
endif

set dir=~/.vimswap//,/var/tmp//,/tmp//,.
