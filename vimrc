execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme desert
set tabstop=4
set incsearch
set noswapfile

map <C-h> :tabp<CR>
map <C-l> :tabn<CR>
map <F2> :NERDTreeToggle<CR>

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-H> <C-W>h<C-W>_
map <C-L> <C-W>l<C-W>_

vmap <Tab> >gv
vmap <S-Tab> <gv

let g:ctrlp_cmd = 'CtrlPCurWD'
