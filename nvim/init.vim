set shell=/bin/bash

call plug#begin('~/.config/nvim/plug')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }                                  " LSP support for nvim
Plug 'easymotion/vim-easymotion'         " Easymotion
Plug 'godlygeek/tabular'                 " Alignment
Plug 'iCyMind/NeoSolarized'              " Solarized for nvim
Plug 'junegunn/fzf'                      " Fuzzy file find
Plug 'roxma/nvim-completion-manager'     " nvim completion engine
Plug 'tpope/vim-commentary'              " Comments
Plug 'tpope/vim-fugitive'                " Git
Plug 'tpope/vim-repeat'                  " Add '.' repeat to more things

call plug#end()

" Enable python
let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python2'

set hidden                " Put buffer into background without saving first
set hlsearch              " Highlight search terms
set incsearch             " highlight terms dynamically as they are typed
set number                " With relativenumber on, shows absolute line num on current line
set relativenumber        " Turn on relative numbers
set ruler                 " Line/col info at right-most region of status line
set scrolloff=6           " Starts scrolling x lines before the end
set shortmess=aOtTI       " Shorter interactive messages
set showcmd               " Show partial commands in the lower-right corner
set tags=tags;~/          " Look for file in the current directory until home
set visualbell            " Turn annoying beeps into visual flash
set wildmode=list:longest " Show tab completions like shell

" Set tab width to 4
set tabstop=4
set shiftwidth=4
set expandtab

" Sets the backup dir to be at x
set backupdir=~/tmp/.vimtmp,/tmp
set directory=~/tmp/.vimtmp,/tmp
set undodir=~/tmp/.vimtmp,/tmp

" Extended '%' matching so that it applies to 
" more things like XML start/close tags and if/else
runtime macros/matchit.vim

set history=144 " Longer history

" '/' searches are only case-sensitive when it contains a capital letter.
set ignorecase
set smartcase

" Neovim-fixed solarized
set termguicolors
set background=light
colorscheme NeoSolarized

filetype plugin indent on " Turn on filetype detection and indentation
syntax on " Syntax highlighting

" Spacemacs-style keybindings
let mapleader=" " " Set <Space> as the <leader>
nmap <silent> <leader>thl :silent :noh<CR>
nmap <leader>_r :so $MYVIMRC<CR>
nmap <leader>b :buffers<CR>

" Faster buffer and tab management
nmap <C-D-n> :bp<CR>
nmap <C-D-s> :bn<CR>

" Some normal macOS commands
nmap <D-s> :w<CR>
nmap <D-a> :%y+<CR>
nmap <D-w> :close<CR>

" <C-e> and <C-y> scrolls x lines at a time
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

