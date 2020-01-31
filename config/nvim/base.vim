syntax on
filetype plugin indent on

set background=dark
color palenight

let g:airline_theme='palenight'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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
set nowritebackup
set noswapfile
set history=1000
set undodir=$HOME/.vim-undo
set viewdir=$HOME/.vim-views
set hidden
set inccommand=nosplit
set termguicolors

nmap j gj
nmap k gk
vmap j gj
vmap k gk

" ranger
map <leader>n :RangerWorkingDirectory<CR>

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
nmap <C-T> :Files<CR>
nmap ; :Buffers<CR>
let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow(0.5)' }

"Ag settings
nnoremap \ :CtrlSF<SPACE>
let g:ctrlsf_position = 'right'
let g:ctrlsf_ackprg = 'rg'

"quick exit
map Q :qa<CR>

"always wrap in vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif

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
nmap <leader>d :bdelete<cr>

"Make current buffer the only buffer
nmap <leader>o :Bdelete hidden<cr>

" comment alignment
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1

" No indent markers by default
let g:indentLine_enabled = 0

" Easymotion
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-overwin-f2)

" don't move cursor on star search
nnoremap * :keepjumps normal! mi*`i<CR>

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory = "~/Code/dotfiles/snippets"
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" misc
nmap <leader>h :noh<CR>
nmap <leader>l :IndentLinesToggle<CR>

" VIMRC editing
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Popup windows
autocmd TermOpen term://* startinsert

function! CreateCenteredFloatingWindow(scale)
  let width = float2nr(&columns * a:scale)
  let height = float2nr(&lines * a:scale)
  let top = ((&lines - height) / 2) - 1
  let left = (&columns - width) / 2
  let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

  let top = "╭" . repeat("─", width - 2) . "╮"
  let mid = "│" . repeat(" ", width - 2) . "│"
  let bot = "╰" . repeat("─", width - 2) . "╯"
  let lines = [top] + repeat([mid], height - 2) + [bot]
  let s:buf = nvim_create_buf(v:false, v:true)
  call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
  call nvim_open_win(s:buf, v:true, opts)
  set winhl=Normal:Floating
  let opts.row += 1
  let opts.height -= 2
  let opts.col += 2
  let opts.width -= 4
  call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
  au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! OpenTerm(cmd)
  call CreateCenteredFloatingWindow(0.8)
  call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
endfunction

function! OnTermExit(job_id, code, event) dict
  if a:code == 0
    bd!
  endif
endfunction

function! OpenLazyGit()
  call OpenTerm('lazygit')
endfunction
nnoremap <leader>g :call OpenLazyGit()<CR>
