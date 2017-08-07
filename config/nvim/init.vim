filetype plugin indent on
syntax on
set background=dark
colorscheme solarized8_light

set number
set laststatus=2
set modelines=5
set vb t_vb=
set ts=2 sts=2 sw=2 expandtab
set listchars=tab:▸\ ,eol:¬
set incsearch
set nojoinspaces
set display+=lastline
set colorcolumn=160 "for deal page

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

let g:vim_bootstrap_langs = "go,html,javascript,python,ruby"
" let g:vim_bootstrap_editor = "nvim"				" nvim or vim

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('lifepillar/vim-solarized8', {'type':'opt'})
call minpac#add('tpope/vim-surround') " easy mappings to surround
call minpac#add('tpope/vim-unimpaired') " alias mappings
call minpac#add('tpope/vim-endwise') " Finish end structures in Ruby
call minpac#add('tpope/vim-fugitive') " Git
call minpac#add('tpope/vim-commentary') " Easy code comments
call minpac#add('tpope/vim-projectionist') " granular project config
call minpac#add('tpope/vim-eunuch') " helpers for unix commands
call minpac#add('machakann/vim-highlightedyank') "highlight yank text
call minpac#add('kassio/neoterm') " mappings for T in neoterm
call minpac#add('bronson/vim-trailing-whitespace')
call minpac#add('Raimondi/delimitMate') " comlete closing ([{
call minpac#add('Yggdroot/indentLine') " show line indentation levels
if has('nvim')
  call minpac#add('Shougo/deoplete.nvim') " keyword completion
endif
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

call minpac#add('airblade/vim-gitgutter') " gutters for git
call minpac#add('janko-m/vim-test') " general test runner
" run tests with :T
let test#strategy = "neoterm"

call minpac#add('scrooloose/nerdtree')
"NERDtree map
ab nt NERDTree
let g:NERDTreeDirArrows=0

call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')

call minpac#add('junegunn/fzf.vim')
" Load FZF from homebrew installation
set runtimepath^=/usr/local/opt/fzf
runtime plugin/fzf.vim

" langs and frameworks
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-rake')
call minpac#add('tpope/vim-rails')
call minpac#add("sheerun/vim-polyglot")
" call minpac#add('scrooloose/syntastic')
" call minpac#add('neomake/neomake')
call minpac#add('w0rp/ale') " async lint engine

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" solarized8 color switch
nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
    \ ? substitute(g:colors_name, 'dark', 'light', '')
    \ : substitute(g:colors_name, 'light', 'dark', '')
    \ )<cr>

if has('nvim')
  tnoremap <C-[> <C-\><C-n>
  " tnoremap <A-[> <C-\><C-n>
  tnoremap <C-h> <c-\><c-n><c-w>h
  tnoremap <C-j> <c-\><c-n><c-w>j
  tnoremap <C-k> <c-\><c-n><c-w>k
  tnoremap <C-l> <c-\><c-n><c-w>l
  tnoremap <C-r> <C-r>
endif

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" map leader
let mapleader=","
let g:mapleader=","
nnoremap \ ,

"Map Tabs
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>
map tN :tabnew<CR>

" use fzf
map <Leader>p :Files<CR>
" Easy buffer switching with fzf
nnoremap <Space> :Bu<CR>

let g:airline_theme="solarized"
let g:airline_solarized_bg='light'
let g:airline_powerline_fonts = 1
" disable tabline completely
" let g:airline#extensions#tabline#enabled = 0
" configure tableine
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
  \ ? substitute(g:colors_name, 'dark', 'light', '')
  \ : substitute(g:colors_name, 'light', 'dark', '')
  \ )<cr>

nnoremap <Left> :vertical resize -5<CR>
nnoremap <Right> :vertical resize +5<CR>
nnoremap <Up> :resize -5<CR>
nnoremap <Down> :resize +5<CR>
" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" pretty print json
command! FormatJSON %!python -m json.tool
