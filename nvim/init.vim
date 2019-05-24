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

" Integrations
" Plug 'tpope/vim-fugitive'

" Cosmetic
Plug 'kien/rainbow_parentheses.vim'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'

" UI
Plug 'Shougo/denite.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'majutsushi/tagbar'

" Specific languages
Plug 'sheerun/vim-polyglot'
" Plug 'guns/vim-clojure-static'
" Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-salve'
" Plug 'guns/vim-clojure-highlight'

call plug#end()

" =================================
" ========== Vim Options ========== 
" =================================

" Setup syntax highlighting and colour schemes
syntax enable
set background=dark " Dark mode
colorscheme gruvbox

set number relativenumber " Setting both gives us hybrid numbers
set colorcolumn=80 " Ruler at 80 col

" Setup python3
let g:loaded_python_provider = 1 " No need for python2
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

set tabstop=4 " Tabs are 4 spaces
set shiftwidth=4 " Indent is 4 spaces also
set expandtab " Tab key inserts spaces
set hidden

" ============================================
" ============ KEYBOARD SHORTCUTS ============ 
" ============================================

" Set leader to space
let mapleader = ' '

" F9/F10 for prev/next buffer
nmap <F9>  :bprev<CR>
nmap <F10> :bnext<CR>

" Because lazy
nnoremap <Leader>w :write<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <Leader>le <C-w>=

" ==================================
" ========== MISC PLUGINS ==========
" ==================================

" Toggle tagbar, then redistribute window space
nnoremap <F8> :TagbarToggle<CR><C-w>=

" ========================================
" ============= DENITE SETUP =============
" ========================================

" === Denite shorcuts === "
"   `         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>f - Search current directory for occurences of given term and
"   close window if no results
nmap `              :Denite buffer -split=floating <CR>
nmap <leader>t      :Denite file/rec -split=floating <CR>
nnoremap <leader>f  :<C-u>Denite grep:. -no-empty -mode=normal<CR>
nnoremap <Leader>s  :Denite colorscheme -split=floating<CR>

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

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" ===============================================
" ========== LANGUAGE-SPECIFIC OPTIONS ==========
" ===============================================

augroup filetype_c
    autocmd!
    autocmd FileType c setlocal noexpandtab shiftwidth=8 tabstop=8
        \ commentstring=//\ %s
augroup END
