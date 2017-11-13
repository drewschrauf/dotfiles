call plug#begin('~/.vim/plugged')

"Theme
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Environment
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'editorconfig/editorconfig-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'https://github.com/rking/ag.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'octref/RootIgnore'
Plug 'neomake/neomake'
Plug 'janko-m/vim-test'
Plug 'https://github.com/edkolev/tmuxline.vim.git'
Plug 'christoomey/vim-tmux-navigator'

"Editing
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'

"Languages
Plug 'sheerun/vim-polyglot'

"Go
Plug 'fatih/vim-go'

"Javascript
Plug 'benjie/neomake-local-eslint.vim'

"Typescript
Plug 'Quramy/tsuquyomi'
Plug 'mhartington/deoplete-typescript'

"Go
Plug 'zchee/deoplete-go', { 'do': 'make'}

call plug#end()

syntax on
filetype plugin indent on

set background=dark
colorscheme hybrid_material

let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'

let mapleader=" "
set t_Co=256
set encoding=utf-8
scriptencoding utf-8
set tabstop=2
set shiftwidth=2
set expandtab
set incsearch
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
"set cursorcolumn
set colorcolumn=100
"highlight ColorColumn ctermbg=0 guibg=lightgrey
set backup
set history=1000
set backupdir=$HOME/.vim-backup
set undodir=$HOME/.vim-undo
set viewdir=$HOME/.vim-views
set directory=$HOME/.vim-swap

nmap j gj
nmap k gk
vmap j gj
vmap k gk

let NERDTreeRespectWildIgnore = 1
map <leader>n <plug>NERDTreeTabsToggle<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


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

"tab and shift tab to move blocks
vmap <Tab> >gv
vmap <S-Tab> <gv

"turn on mouse mode
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

"enable system clipboard
if has('clipboard')
  if has("unix")
    if system('uname')!~'Darwin'
      "set clipboard=unnamed,unnamedplus
      "Do nothing on linux
    endif
  else         " On mac and Windows, use * register for copy-paste
    set clipboard=unnamed
  endif
endif

" Set forever-undo
if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

"recenter editor on match
nmap n nzz
nmap N Nzz

"ctrl+P settings
let g:ctrlp_cmd = 'CtrlPCurWD'

"NERDTree find current budder in tree
nmap <leader>f :NERDTreeFind<cr>

"Ag settings
nnoremap \ :Ag!<SPACE>

"quick exit
map Q :qa<CR>

"always wrap in vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif

" Enable deoplete
let g:deoplete#enable_at_startup = 1

"Always trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

"Better start and end of line
nmap <leader>i ^
nmap <leader>a $

"Neomake
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_jsx_enabled_makers = ['eslint', 'flow']
let g:neomake_typescript_enabled_makers = ['tslint']
let g:neomake_go_enabled_makers = ['golint', 'govet']
autocmd! BufWritePost,BufEnter * Neomake
nmap <leader>lo :lopen<cr>
nmap <leader>lc :lclose<cr>

"vim-test
let test#strategy = "neovim"
let test#javascript#mocha#executable = 'npm run test --silent --'
nmap <leader>tf :TestFile<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tl :TestLast<cr>
nmap <leader>ts :TestSuite<cr>

"Fix issue with ctrl-h not working in neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" quick save
noremap <Leader>s :update<CR>
noremap <Leader>q :q<CR>

" comment alignment
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" allow jsx syntax in .js files
let g:jsx_ext_required = 0

" exit terminal in neovim
tnoremap <Esc> <C-\><C-n>

" detect marko syntax
au BufRead,BufNewFile *.marko setfiletype html

" No indent markers by default
let g:indentLine_enabled = 0

" Easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)

" fix multicursors and deplete
" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
  if exists('g:deoplete#disable_auto_complete')
	  let g:deoplete#disable_auto_complete = 1
  endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
  if exists('g:deoplete#disable_auto_complete')
	  let g:deoplete#disable_auto_complete = 0
  endif
endfunction
