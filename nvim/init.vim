filetype off " Required for Vundle.vim initialisation
set shell=/bin/bash " Vundle requires a POSIX shell

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim' " Required by vundle
Plugin 'easymotion/vim-easymotion' " Easymotion
Plugin 'tpope/vim-fugitive' " Git
Plugin 'tpope/vim-commentary' " Comments
" Plugin 'altercation/vim-colors-solarized' " Solarized colorscheme
Plugin 'frankier/neovim-colors-solarized-truecolor-only' " Neovim fix
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-repeat'
" Plugin 'roxma/nvim-completion-manager'

call vundle#end()

" Neovim-fixed solarized
" set termguicolors
set background=dark
colorscheme solarized

" Turn on filetype detection and indentation
filetype plugin indent on

" Enable python
let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python2'
" let g:loaded_python_provider=0
" let g:loaded_python3_provider=0

" Turn on syntax highlighting
syntax on

" Turn on relative numbers
set relativenumber

" With relativenumber on, shows absolute line num on current line
set number

" Set tab width to 4
set tabstop=4
set shiftwidth=4
set expandtab

" Show partial commands in the lower-right corner
set showcmd

" Spacemacs-style keybindings
" Set <Space> as the <leader>
let mapleader=" "
" thl => toggle / highlight / search highlight
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

" Automatically write to disk while swiching buffers
" set autowrite

" Put buffer into background without saving first
set hidden

" Show tab completions like shell
set wildmenu
set wildmode=list:longest

" Extended '%' matching so that it applies to 
" more things like XML start/close tags and if/else
runtime macros/matchit.vim

" Longer history
set history=144

" '/' searches are only case-sensitive when it contains
" a capital letter.
set ignorecase
set smartcase

" Starts scrolling x lines before the end
set scrolloff=6

" Sets the backup dir to be at x
set backupdir=~/tmp/.vimtmp,/tmp
set directory=~/tmp/.vimtmp,/tmp

" Line/col info at right-most region of status line
set ruler

" Backspacing in insert mode should be reasonable
set backspace=indent,eol,start

" Highlight search terms
set hlsearch
set incsearch " highlight terms dynamically as they are typed

" Shorter interactive messages
set shortmess=aOtTI

" Turn annoying beeps into visual flash
set visualbell

" Look for file in the current directory until home
set tags=tags;~/

