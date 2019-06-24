" =============================
" ========== Plugins ==========
" =============================

" Plugins in their own directory
call plug#begin('~/.config/nvim/plugins')

" Motions and conveniences
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'andymass/vim-matchup'
Plug 'jiangmiao/auto-pairs'
Plug 'bhurlow/vim-parinfer'
Plug 'junegunn/vim-easy-align'
Plug 'ntpeters/vim-better-whitespace'
Plug 'michaeljsmith/vim-indent-object'

" Integrations
" Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-obsession' " Better :mksession

" Cosmetic
Plug 'kien/rainbow_parentheses.vim'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'

" UI
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'neoclide/coc-denite'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug '~/.fzf'

" Specific languages
" Plug 'sheerun/vim-polyglot'
Plug 'elzr/vim-json'
Plug 'xolox/vim-easytags'
" Plug 'guns/vim-clojure-static'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-salve'
" Plug 'guns/vim-clojure-highlight'

" Misc
Plug 'xolox/vim-misc' " Dependency for vim-easytags

call plug#end()

" =================================
" ========== Vim Options ==========
" =================================

" Setup syntax highlighting and colour schemes
syntax enable
set background=dark " Dark mode
colorscheme gruvbox
filetype plugin indent on

set number relativenumber " Setting both gives us hybrid numbers
set colorcolumn=80        " Ruler at 80 col
set cursorline            " Highlight current line

" Setup python3
let g:loaded_python_provider = 1 " No need for python2
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

set tabstop=4    " Tabs are 4 spaces
set shiftwidth=4 " Indent is 4 spaces also
set expandtab    " Tab key inserts spaces
set hidden       " Don't force write before buffer switch
set scrolloff=15 " Minimum lines to keep above and below cursor
set nowrap       " Don't wrap lines
set list         " Show whitespace
set listchars+=space:␣
set textwidth=80
set autowrite

set ignorecase   " Ignore case when searching
set smartcase    " Case sensitive search only if search contains capitals

set autoread     " Re-read file if changed on filesystem

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

" F9/F10 for prev/next tab
noremap <F9>  gT
noremap <F10> gt

" Change paragraph jump maps
noremap ( {
noremap ) }

" Tab pane management
noremap <C-t> :tabe<CR>

" Tag management
nnoremap g[ <C-t>
noremap <C-]> <C-i>
noremap <C-[> <C-o>

" Because lazy
nnoremap <Leader>s :write<CR>
nnoremap <Leader>e :quit<CR>
nnoremap <Leader>le <C-w>=

" Make pane movement also possible in insert mode
inoremap <C-h> <C-w>h
inoremap <C-j> <C-w>j
inoremap <C-k> <C-w>k
inoremap <C-l> <C-w>l

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

" Auto-strip whitespace on modified lines on save
let g:strip_whitespace_on_save = 1
let g:strip_only_modified_lines = 1

nnoremap <Leader>gw :StripWhitespaceOnChangedLines<CR>
nnoremap <Leader>gW :StripWhitespace<CR>

" =============================
" ========== Airline ==========
" =============================
let g:airline_extensions = ['branch', 'hunks', 'tabline', 'denite']
let g:airline_skip_empty_sections = 1 " Don't draw separator for empty sections

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=0 " Don't show git changes
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:airline_section_y = ''

" ========================================
" ============= DENITE SETUP =============
" ========================================

" Default settings
augroup Denite
    autocmd!
    autocmd FileType denite call s:denite_my_settings()
augroup END
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
endfunction

" === Denite shorcuts === "
"   `         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>f - Search current directory for occurences of given term and
"               close window if no results
nnoremap `          :Denite buffer -split=floating <CR>
nnoremap <leader>t  :Denite file/rec -split=floating -default-action=switch<CR>
nnoremap <leader>/g :Denite grep:. -no-empty -mode=normal<CR>
nnoremap <leader>/c :Denite colorscheme -split=floating<CR>

" Use ripgrep instead of grep
" .gitignore is respected by default
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom prompt
call denite#custom#option('default', 'prompt', 'λ:')

" Automatically resize denite window height
call denite#custom#option('default', 'auto_resize', 1)

" Open directly below current pane
call denite#custom#option('default', 'direction', 'rightbelow')

" Minimum height
call denite#custom#option('default', 'winminheight', 10)

" Start in interactive mode
call denite#custom#option('_', { 'start_filter': 1 })

" Non-stupid navigation in denite prompt insert mode
call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap' )
call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap' )

call denite#custom#map(
    \ 'insert',
    \ '<Enter>',
    \ '<denite:do_action:open>',
    \ 'noremap')
call denite#custom#map(
    \ 'insert',
    \ '<C-t>',
    \ '<denite:do_action:tabopen>',
    \ 'noremap')
call denite#custom#map(
    \ 'insert',
    \ '<C-v>',
    \ '<denite:do_action:vsplit>',
    \ 'noremap')
call denite#custom#map(
    \ 'insert',
    \ '<C-s>',
    \ '<denite:do_action:split>',
    \ 'noremap')
