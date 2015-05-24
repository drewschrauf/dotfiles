execute pathogen#infect()
syntax on
filetype plugin indent on

set background=dark
let g:solarized_termcolors=256
colorscheme solarized
if has("gui_win32")
	set guifont=Lucida_Console:h10:cANSI
endif

let mapleader=","
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set noswapfile
set autoindent
set linebreak
set backspace=indent,eol,start
set number
set ignorecase
set relativenumber

nmap j gj
nmap k gk
vmap j gj
vmap k gk

let NERDTreeIgnore = ['^node_modules$','^dist$']
"map <F2> :NERDTreeToggle<CR>
map <F2> <plug>NERDTreeTabsToggle<CR>

imap jj <Esc>

map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

nnoremap <S-h> gT
nnoremap <S-l> gt

vmap <Tab> >gv
vmap <S-Tab> <gv

set mouse=a

nmap <Space> zz
nmap n nzz
nmap N Nzz

let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_custom_ignore = 'node_modules\|dist'

let Grep_Default_Options = '-i'
let Grep_Default_Filelist = '**/*'
nnoremap <C-Space> :Grep<cr>

"let jshint2_save = 1
let g:syntastic_javascript_checkers = ['jsxhint']

nmap <leader>f :NERDTreeFind<cr>
