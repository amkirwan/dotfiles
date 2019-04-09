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
set softtabstop=2
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

set suffixesadd+=.js,.coffee

" map leader
let mapleader=","
let g:mapleader=","
nnoremap \ ,

let g:vim_bootstrap_langs = "go,html,javascript,python,ruby"
" let g:vim_bootstrap_editor = "nvim" " nvim or vim

let g:python3_host_prog  = '/usr/local/Cellar/python3/3.6.4_4/bin/python3'

packadd minpac
call minpac#init()

" minpac commands:
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

call minpac#add('k-takata/minpac', {'type':'opt'})
call minpac#add('tpope/vim-surround') " easy mappings to surround
call minpac#add('tpope/vim-unimpaired') " alias mappings
call minpac#add('tpope/vim-fugitive') " Git
call minpac#add('tpope/vim-commentary') " Easy code comments
call minpac#add('tpope/vim-projectionist') " granular project config
call minpac#add('tpope/vim-eunuch') " helpers for unix commands
call minpac#add('machakann/vim-highlightedyank') "highlight yank text
call minpac#add('kassio/neoterm') " mappings for T in neoterm
call minpac#add('bronson/vim-trailing-whitespace')
call minpac#add('Yggdroot/indentLine') " show line indentation levels
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim') " Vim's compiler plugins async
call minpac#add('mhinz/vim-grepper')
call minpac#add('tpope/vim-vinegar') " netrw helper
call minpac#add('justinmk/vim-sneak') " Vim missing motion s{char}{char}
call minpac#add('kchmck/vim-coffee-script') " coffeescript support
call minpac#add('dzeban/vim-log-syntax') "
call minpac#add('pangloss/vim-javascript') " vim javascript
" call minpac#add('SirVer/ultisnips')
" call minpac#add('honza/vim-snippets')
" call minpac#add('othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] })
" call minpac#add('ervandew/supertab')
" call minpac#add("ludovicchabant/vim-gutentags") " Manages ctag files

set termguicolors
call minpac#add("morhetz/gruvbox")
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="medium"

" call minpac#add("lifepillar/vim-solarized8")
" set background=dark
" colorscheme solarized8_high
" let g:solarized_diffmode="high"
" colorscheme dracula
" colorscheme codedark
"
"
" if has('nvim')
"   call minpac#add('Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' })
"   call minpac#add('autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' })
"   " call minpac#add('carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' })
" endif
" let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

let g:SuperTabCrMapping = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

let g:UltiSnipsExpandTrigger="<C-j>"

" Required for operations modifying multiple buffers like rename.
set hidden

let g:coc_force_debug=1
call minpac#add('neoclide/coc.nvim', {'do': 'call coc#util#build()'})
call minpac#add('liuchengxu/vista.vim')
" let g:LanguageClient_serverCommands = {
"   \ 'go': ['bingo'],
"   \ 'javascript': ['javascript-typescript-stdio'],
"   \ 'javascript.jsx': ['javascript-typescript-stdio'],
"   \ 'typescript': ['javascript-typescript-stdio'],
"   \ }

" let g:LanguageClient_rootMarkers = {
"   \ 'go': ['.git', 'go.mod'],
"   \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" " Or map each action separately
" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" set completeopt=longest,menuone,preview
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

call minpac#add('Shougo/echodoc.vim') " echodoc for function signature display
set cmdheight=2
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Always draw the signcolumn.
set signcolumn=yes

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
call minpac#add("mustache/vim-mustache-handlebars")
"call minpac#add('neomake/neomake')
" call minpac#add('w0rp/ale') " async lint engine

" install last
call minpac#add('ryanoasis/vim-devicons')

" ale configuration
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:airline#extensions#ale#enabled = 1


" let g:ale_linters = {
" \   'javascript': ['prettier', 'eslint'],
" \ }
" let g:ale_fixers = {
" \   'javascript': ['prettier', 'eslint'],
" \ }

" let g:ale_completion_enabled = 1
" let g:ale_javascript_prettier_options = '--single-quote  --trailing-comma'
" let g:ale_sign_column_always = 1
" let g:ale_fix_on_save = 1

" nmap <leader>af <Plug>(ale_fix)
" " mappings in the style of unimpaired
" nmap <silent> [W <Plug>(ale_first)]
" nmap <silent> [w <Plug>(ale_previous)]
" nmap <silent> ]w <Plug>(ale_next)]
" nmap <silent> ]W <Plug>(ale_last)]

" " solarized8 color switch
" nnoremap  <leader>B :<c-u>exe "colors" (g:colors_name =~# "dark"
"     \ ? substitute(g:colors_name, 'dark', 'light', '')
"     \ : substitute(g:colors_name, 'light', 'dark', '')
"     \ )<cr>

if has('nvim')
  tnoremap <C-[> <C-\><C-n>
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-[> <Esc>
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

" let g:airline_theme="dracula"
let g:airline_theme="gruvbox"
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

let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.tools = ['rg', 'git', 'grep']
let &statusline .= ' %{grepper#statusline()}'
nnoremap <Leader>gg :Grepper -tool git
nnoremap <Leader>gr :Grepper -tool rg

" Search for the current word
nnoremap <Leader>* :Grepper -tool rg -cword -noprompt<CR>
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

autocmd FileType qf nnoremap <buffer><silent> t :execute 'tabedit' matchstr(getline('.'), '^.\{-}\ze\|')<cr>

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

noremap Tn :Tnew<CR>

" map to opening tabs
noremap <Leader>Tn :tabnew <bar> :term<CR>
noremap <Leader>Ts :sp<bar> :term<CR>

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

" config coc
source $HOME/.config/nvim/coc.vimrc
source $HOME/.config/nvim/vista.vimrc

