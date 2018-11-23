call plug#begin('~/.vim/plugged')

"Theme
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Environment
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'octref/RootIgnore'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'https://github.com/edkolev/tmuxline.vim.git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'qpkorr/vim-bufkill'
Plug 'Asheq/close-buffers.vim'
Plug 'blueyed/vim-qf_resize'

"Editing
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'nelstrom/vim-visual-star-search'

"Languages
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier'

"Go
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

"Typescript
Plug 'https://github.com/HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

"Jsonnet
Plug 'google/vim-jsonnet'

call plug#end()

syntax on
filetype plugin indent on

set background=dark
colorscheme Tomorrow-Night

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

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
set breakindent
set backspace=indent,eol,start
set number
set ignorecase
set relativenumber
set autoread
set splitright
set splitbelow
set cursorline
set colorcolumn=100
set nobackup
set noswapfile
set history=1000
set undodir=$HOME/.vim-undo
set viewdir=$HOME/.vim-views
set hidden

nmap j gj
nmap k gk
vmap j gj
vmap k gk

let NERDTreeRespectWildIgnore = 1
map <leader>n :NERDTreeToggle<CR>

"quickly exit insert mode
imap jj <Esc>

"change split
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l

"vimux
let g:VimuxOrientation="h"
let g:VimuxHeight="30"
nmap <leader>r :VimuxPromptCommand<CR>

"tab and shift tab to move blocks
vmap <Tab> >gv
vmap <S-Tab> <gv

"turn on mouse mode
set mouse+=a
if &term =~ '^screen'
    set ttymouse=xterm2
endif

" Figure out the system Python for Neovim.
if exists("$VIRTUAL_ENV")
  let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
  let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
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

"recenter editor on scroll
nmap <C-D> <C-D>zz
nmap <C-U> <C-U>zz
nmap <C-F> <C-F>zz
nmap <C-B> <C-B>zz

"fzf
nmap <C-P> :Files<CR>
nmap ; :Buffers<CR>

"NERDTree find current buffer in tree
nmap <leader>f :NERDTreeFind<cr>

"Ag settings
nnoremap \ :CtrlSF<SPACE>
let g:ctrlsf_position = 'right'

"quick exit
map Q :qa<CR>

"always wrap in vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Close deoplete preview after complete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

"Better start and end of line
nmap <leader>i ^
nmap <leader>a $

"Fix issue with ctrl-h not working in neovim
if has('nvim')
  nmap <BS> <C-W>h
endif

" quick save
noremap <leader>s :update<CR>

" quick delete
nmap <leader>d :BD<cr>

"Make current buffer the only buffer
nmap <leader>o :CloseHiddenBuffers<cr>

" comment alignment
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" allow jsx syntax in .js files
let g:jsx_ext_required = 0

" No indent markers by default
let g:indentLine_enabled = 0

" Easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)

" Typescript settings
let g:polyglot_disabled = ['typescript']
let g:tsuquyomi_use_dev_node_module = 2
let g:tsuquyomi_tsserver_path = substitute(system("npm bin"), '\n\+$', '', '') . "/tsserver"
autocmd FileType typescript,typescriptreact nnoremap <buffer> <leader>ti :TSDef<cr>
autocmd FileType typescript,typescriptreact nnoremap <buffer> <leader>td :TSDoc<cr>
autocmd FileType typescript,typescriptreact nnoremap <buffer> <leader>tr :TSRefs<cr>
autocmd FileType typescript,typescriptreact nnoremap <buffer> <leader>tc :TSRename<cr>

" don't move cursor on star search
nnoremap * :keepjumps normal! mi*`i<CR>

" misc
nmap <leader>h :noh<CR>
nmap <leader>l :IndentLinesToggle<CR>

" VIMRC editing
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

let g:ale_linter_aliases = {'typescriptreact': 'typescript'}
