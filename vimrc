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
set autoread
set noreadonly

nmap j gj
nmap k gk
vmap j gj
vmap k gk

let NERDTreeIgnore = ['^node_modules$','^dist$']
"map <F2> :NERDTreeToggle<CR>
map <F2> <plug>NERDTreeTabsToggle<CR>

"quickly exit insert mode
imap jj <Esc>

"change split
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

"change tabs
nnoremap <S-h> gT
nnoremap <S-l> gt

"move line up or down with alt
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"tab and shift tab to move blocks
vmap <Tab> >gv
vmap <S-Tab> <gv

"turn on mouse mode
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

"recenter editor on space or match
nmap <Space> zz
nmap n nzz
nmap N Nzz

"ctrl+P settings
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_custom_ignore = 'node_modules\|dist'

let Grep_Default_Options = '-i'
let Grep_Default_Filelist = '**/*'
"nnoremap <C-Space> :Grep<cr>

"syntastic settings
"let jshint2_save = 1
let g:syntastic_javascript_checkers = ['jsxhint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NERDTree find current budder in tree
nmap <leader>f :NERDTreeFind<cr>

"Ag settings
nnoremap \ :Ag<SPACE>
