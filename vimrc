call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'terryma/vim-multiple-cursors'
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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-fugitive'
Plug 'octref/RootIgnore'
Plug 'neomake/neomake'
Plug 'benjie/neomake-local-eslint.vim'
Plug 'janko-m/vim-test'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'
Plug 'vim-airline/vim-airline-themes'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'https://github.com/edkolev/tmuxline.vim.git'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'elixir-lang/vim-elixir'
Plug 'freitass/todo.txt-vim'
call plug#end()

syntax on
filetype plugin indent on

set background=dark
colorscheme hybrid

let g:airline_powerline_fonts = 1
let g:airline_theme = 'hybrid'

let mapleader=" "
set t_Co=256
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
if has('clipboard')
  if has("unix")
    if system('uname')!~'Darwin'
      set clipboard=unnamed,unnamedplus
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

"recenter editor on space or match
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

"SuperTab cycle down
let g:SuperTabDefaultCompletionType = '<c-n>'

" Enable deoplete
let g:deoplete#enable_at_startup = 1

"Always trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

"Better start and end of line
nmap <leader>i ^
nmap <leader>a $

"Neomake
let g:neomake_javascript_enabled_makers = ['eslint']
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

" Bookmark saving
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_no_default_key_mappings = 1
function! BookmarkMapKeys()
    nmap mm :BookmarkToggle<CR>
    nmap mi :BookmarkAnnotate<CR>
    nmap mn :BookmarkNext<CR>
    nmap mp :BookmarkPrev<CR>
    nmap ma :BookmarkShowAll<CR>
    nmap mc :BookmarkClear<CR>
    nmap mx :BookmarkClearAll<CR>
    nmap mkk :BookmarkMoveUp
    nmap mjj :BookmarkMoveDown
endfunction
function! BookmarkUnmapKeys()
    unmap mm
    unmap mi
    unmap mn
    unmap mp
    unmap ma
    unmap mc
    unmap mx
    unmap mkk
    unmap mjj
endfunction
autocmd BufEnter * :call BookmarkMapKeys()
autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()
