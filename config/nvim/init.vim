filetype plugin indent on
syntax on

set number
set laststatus=2
set modelines=5
set vb t_vb=
" set ts=2 sts=2 sw=2 expandtab
" set listchars=tab:▸\ ,eol:
set incsearch
set nojoinspaces
set display+=lastline
set colorcolumn=160 "for deal page

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" map leader
let mapleader=","
let g:mapleader=","
nnoremap \ ,

let g:vim_bootstrap_langs = "go,html,javascript,python,ruby"
" let g:vim_bootstrap_editor = "nvim"				" nvim or vim

let g:python3_host_prog  = '/usr/local/Cellar/python3/3.6.4_4/bin/python3'

packadd minpac
call minpac#init()

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

call minpac#add('k-takata/minpac', {'type':'opt'})
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
call minpac#add('tpope/vim-dispatch')
call minpac#add("radenling/vim-dispatch-neovim") " Vim's compiler plugins async
call minpac#add("mhinz/vim-grepper")
call minpac#add("tpope/vim-vinegar")
call minpac#add("dracula/vim")

"call minpac#add("lifepillar/vim-solarized8")
"set termguicolors
"set background=dark
"colorscheme solarized8_dark
"let g:solarized_diffmode="high"
color dracula

if has('nvim')
  call minpac#add('Shougo/deoplete.nvim') " keyword completion
endif
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

call minpac#add('airblade/vim-gitgutter') " gutters for git
call minpac#add('janko-m/vim-test') " general test runner
" run tests with :T
let test#strategy = "neovim"

" Run the whole test file
nnoremap <leader>tf :TestFile<CR>
" Run the Test Suite
nnoremap <leader>ts :TestSuite<CR>
" Run the Closest Test Nearest
nnoremap <leader>tn :TestNearest<CR>
" Run the Closest Test Last
nnoremap <leader>tl :TestLast<CR>

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
"call minpac#add('neomake/neomake')
call minpac#add('w0rp/ale') " async lint engine

let g:ale_linters = {
\   'javascript': ['prettier', 'eslint'],
\ }
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\ }

let g:ale_completion_enabled = 1
let g:ale_javascript_prettier_options = '--single-quote  --trailing-comma'
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1

nmap <leader>af <Plug>(ale_fix)
" mappings in the style of unimpaired
nmap <silent> [W <Plug>(ale_first)]
nmap <silent> [w <Plug>(ale_previous)]
nmap <silent> ]w <Plug>(ale_next)]
nmap <silent> ]W <Plug>(ale_last)]

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
  tnoremap <C-b> <c-\><c-n>:tabprev<CR>
  tnoremap <C-f> <c-\><c-n>:tabnew<CR>
endif

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"Map Tabs
map tf :tabfirst<CR>
map th :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>
map tN :tabnew<CR>

" Easy buffer switching with fzf
nnoremap <Space> :Bu<CR>

let g:airline_theme="dracula"
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

" ale configuration
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1

let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.tools = ['rg', 'git', 'grep']
let &statusline .= ' %{grepper#statusline()}'
nnoremap <Leader>g :Grepper -tool git
nnoremap <Leader>G :Grepper -tool rg

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" ripgrep :Find term
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
" use fzf with ripgrep
let g:rg_command = '
  \ rg --column --line-number --no-heading --vimgrep --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,mustache}"
  \ -g "!{.git,node_modules,vendor,public,tmp}/*" '
"Files config in .zshrc
map <Leader>p :Files<CR>
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperRg")

"Term
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" NeoTerm
" Useful maps
" hide/close terminal
nnoremap <silent> <leader>tc :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>tk :call neoterm#kill()<cr>

map Tn :Tnew<CR>

let g:neoterm_autoinsert = 1

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>

" prevent starting nested terminal in neovim
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" netrw
let g:netrw_banner = 0
