call pathogen#helptags()
call pathogen#infect()

set ruler
set t_Co=256
set background=dark
set ruler
set t_Co=256
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
nmap <silent> <leader>t :CommandT<CR>
nmap <silent> <leader>b :CommandTBuffer<CR>

set listchars=tab:>-,trail:·,eol:$
set showbreak=.

set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\ [%l/%L\ (%p%%)]

set numberwidth=5
set number

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"json is javascript, so, uh, just use that
autocmd BufNewFile,BufRead *.json set ft=javascript

let mapleader = ","
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

nmap <F2> :!/Applications/Shoes.app/Contents/MacOS/shoes %:p<CR>
nnoremap <leader>f :Ack 

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
run SyntasticEnable ruby
run SyntasticEnable javascript
run SyntasticEnable coffee
run SyntasticEnable haml
run SyntasticEnable perl
run SyntasticEnable python
run SyntasticEnable sass
run SyntasticEnable sh
