" =============================
" ========== Plugins ==========
" =============================

" Plugins in their own directory
call plug#begin('~/.config/nvim/plugins')

" Motions and conveniences
Plug 'tpope/vim-surround'              " Adds surround action
Plug 'tpope/vim-commentary'            " Adds the comment action
Plug 'andymass/vim-matchup'            " Adds more matches to % and more motions
"Plug 'jiangmiao/auto-pairs'            " Insert quotes and brackets in pairs
Plug 'bhurlow/vim-parinfer'            " Parinfer
Plug 'junegunn/vim-easy-align'         " Adds the align command
Plug 'michaeljsmith/vim-indent-object' " Adds the indentation text objs

" Integrations
Plug 'christoomey/vim-tmux-navigator' " Adds tmux navigation
Plug 'tpope/vim-obsession'            " Better :mksession

" Cosmetic
Plug 'kien/rainbow_parentheses.vim'   " Rainbow parentheses that match
Plug 'morhetz/gruvbox'                " gruvbox theme
Plug 'NLKNguyen/papercolor-theme'     " Papercolor theme
Plug 'vim-airline/vim-airline-themes' " Extra airline themes

" UI
Plug 'airblade/vim-gitgutter'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Plug 'neoclide/coc-denite'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug '/usr/local/opt/fzf'

" Specific languages
Plug 'xolox/vim-easytags'

" LaTeX
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'SirVer/ultisnips'

" Misc
Plug 'xolox/vim-misc' " Dependency for vim-easytags

call plug#end()

" =================================
" ========== Vim Options ==========
" =================================

" Setup syntax highlighting and colour schemes
syntax enable
set background=light
colorscheme PaperColor
filetype plugin indent on
set termguicolors

set number relativenumber " Setting both gives us hybrid numbers
set colorcolumn=80        " Ruler at 80 col
set cursorline            " Highlight current line

" Setup python3
let g:loaded_python_provider = 1 " No need for python2
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set tabstop=4       " Tabs are 4 spaces
set shiftwidth=4    " Indent is 4 spaces also
set expandtab       " Tab key inserts spaces
set hidden          " Don't force write before buffer switch
set scrolloff=15    " Minimum lines to keep above and below cursor
set nowrap          " Don't wrap lines
set list            " Show whitespace
set textwidth=80    " Wrap text after col 80
set autowrite       " Write file on :make, <C-]>, nav to new buffer, and others
"set virtualedit=all " Walk into invalid spaces
set ignorecase      " Ignore case when searching
set smartcase       " Case sensitive search only if search contains capitals
set autoread        " Re-read file if changed on filesystem
" set listchars+=space:␣

" Put backups in their own folder
set backupdir=~/.local/share/nvim/backup
set nobackup nowritebackup

" Session restore options
" Restores: current directory, folds, help pages, window sizes, and all tabs
set sessionoptions=curdir,folds,help,resize,options,tabpages

" Buffer management: open new buffers in their own vertical split
set switchbuf=usetab,vsplit
set splitbelow splitright

" ============================================
" ============ KEYBOARD SHORTCUTS ============
" ============================================

" Set leader to space
let mapleader = ' '

" Change paragraph jump maps
noremap ( {
noremap ) }

" Because lazy
nnoremap <Leader>s :write<CR>
nnoremap <Leader>e :close<CR>
nnoremap <Leader>le <C-w>=
nnoremap <Leader>t :FZF<CR>
nnoremap <Leader>b :ls<CR>
nnoremap <Leader>al :tabe ~/.config/nvim/init.vim<CR>
nnoremap <Leader>ar :so ~/.config/nvim/init.vim<CR>
nnoremap , :

nnoremap [b :bprev<CR>
nnoremap ]b :bnext<CR>

" Make pane movement also possible in insert mode
inoremap <C-h> <C-w>h
inoremap <C-j> <C-w>j
inoremap <C-k> <C-w>k
inoremap <C-l> <C-w>l

" ===============================
" ========= LATEX ===============
" ===============================
let g:tex_flavor='latex'
let g:tex_conceal='abdmgs'
"let g:vimtex_compiler_progname = 'nvr'
"let g:vimtex_compiler_method = 'tectonic'

augroup latex
    autocmd!
    autocmd FileType tex setlocal conceallevel=2
augroup END

" LaTeX snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" ==================================
" ========== MISC PLUGINS ==========
" ==================================

" Toggle tagbar, then redistribute window space
nnoremap <F8> :TagbarToggle<CR><C-w>=
let g:tagbar_left=1

" Alignment
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

let g:easytags_async = 1         " Run ctags in the background
let g:easytags_dynamic_files = 1 " Look in local dir for tags file

" Jump between hunks
nmap <Leader>n <Plug>GitGutterNextHunk
nmap gn        <Plug>GitGutterNextHunk
nmap <Leader>p <Plug>GitGutterPrevHunk

" Hunk-add and hunk-revert for chunk staging
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gu <Plug>GitGutterUndoHunk
let g:gitgutter_git_executable = '/usr/bin/git'

" Auto-strip whitespace on modified lines on save
"let g:strip_whitespace_on_save = 1
let g:strip_only_modified_lines = 1

nnoremap <Leader>gw :StripWhitespaceOnChangedLines<CR>
nnoremap <Leader>gW :StripWhitespace<CR>

" =============================
" ========== Airline ==========
" =============================
let g:airline_extensions = ['branch', 'hunks', 'tabline']
let g:airline_skip_empty_sections = 1 " Don't draw separator for empty sections

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0 " Don't show git changes
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_section_y = ''
