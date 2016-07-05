call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'terryma/vim-multiple-cursors'
Plug 'https://github.com/vim-scripts/repmo.vim.git'
Plug 'editorconfig/editorconfig-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'https://github.com/rking/ag.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'octref/RootIgnore'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'janko-m/vim-test'
Plug 'terryma/vim-expand-region'
call plug#end()

syntax on
filetype plugin indent on

let g:airline_powerline_fonts = 1
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai
if has("gui_running")
    set guifont=Hack_Regular:h13
endif
if has("gui_win32")
	set guifont=Lucida_Console:h10:cANSI
endif

let mapleader=" "
set t_Co=256
set tabstop=2
set shiftwidth=2
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
set splitright
set splitbelow
set cursorline
set cursorcolumn
set colorcolumn=80
"highlight CursorColumn ctermbg=0 guibg=lightgrey
highlight ColorColumn ctermbg=0 guibg=lightgrey

nmap j gj
nmap k gk
vmap j gj
vmap k gk

"let NERDTreeIgnore = ['^node_modules$','^dist$','marko\.js$', '^coverage']
let NERDTreeRespectWildIgnore = 1
"map <F2> :NERDTreeToggle<CR>
"map <F2> <plug>NERDTreeTabsToggle<CR>
map <leader>n <plug>NERDTreeTabsToggle<CR>

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

"enable system clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

"recenter editor on space or match
"nmap <Space> zz
nmap n nzz
nmap N Nzz

"ctrl+P settings
let g:ctrlp_cmd = 'CtrlPCurWD'
"let g:ctrlp_custom_ignore = 'node_modules\|dist'

let Grep_Default_Options = '-i'
let Grep_Default_Filelist = '**/*'
"nnoremap <C-Space> :Grep<cr>

"NERDTree find current budder in tree
nmap <leader>f :NERDTreeFind<cr>

"Ag settings
nnoremap \ :Ag!<SPACE>

"quick exit
map Q :qa<CR>

"always wrap in vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif

"SuperTab cycle down
let g:SuperTabDefaultCompletionType = '<c-n>'

"Always trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

"Better start and end of line
nmap <leader>i ^
nmap <leader>a $

let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost,BufEnter * Neomake

let test#strategy = "neovim"
let test#javascript#mocha#executable = 'npm run testfile --silent --'
nmap <leader>tn :TestNearest<cr>
nmap <leader>tl :TestLast<cr>

nmap <leader>lo :lopen<cr>
nmap <leader>lc :lclose<cr>

if has('nvim')
  nmap <BS> <C-W>h
endif

" quick save
noremap <Leader>s :update<CR>
