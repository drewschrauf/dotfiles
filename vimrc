execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme desert
if has("gui_win32")
	set guifont=Lucida_Console:h10:cANSI
endif

let mapleader=","
set tabstop=4
set expandtab
set incsearch
set noswapfile
set autoindent
set linebreak
set backspace=indent,eol,start
set number

nmap j gj
nmap k gk
vmap j gj
vmap k gk

let NERDTreeIgnore = ['^node_modules$','^dist$']
map <F2> :NERDTreeToggle<CR>

imap jj <Esc>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

nnoremap <S-h> gT
nnoremap <S-l> gt

vmap <Tab> >gv
vmap <S-Tab> <gv

nmap <Space> zz
nmap n nzz
nmap N Nzz

let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_custom_ignore = 'node_modules\|dist'

let jshint2_save = 1
