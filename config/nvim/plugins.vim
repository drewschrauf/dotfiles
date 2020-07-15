call plug#begin('~/.vim/plugged')

"Theme
Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'

"Environment
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'wesQ3/vim-windowswap'
Plug 'dyng/ctrlsf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'wincent/terminus'
Plug 'Asheq/close-buffers.vim'
Plug 'dbeniamine/todo.txt-vim'

"Editing
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'nelstrom/vim-visual-star-search'
Plug 'Shougo/neosnippet.vim'

"Languages
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'stephpy/vim-yaml'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'kchmck/vim-coffee-script'

call plug#end()
