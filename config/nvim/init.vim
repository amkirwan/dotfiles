filetype plugin indent on
syntax on

set nu rnu
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
call minpac#add('yssl/QFEnter') " quickfix open file in location list where you wish
call minpac#add('haya14busa/is.vim') " incremental search improvement
call minpac#add('nelstrom/vim-visual-star-search') " visual star search

set termguicolors
call minpac#add("gruvbox-community/gruvbox")
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="hard"

" Required for operations modifying multiple buffers like rename.
set hidden

call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('liuchengxu/vista.vim')

" Always draw the signcolumn.
set signcolumn=yes

call minpac#add('airblade/vim-gitgutter') " gutters for git
call minpac#add('janko-m/vim-test') " general test runner
" run tests with :T
let test#strategy = "neovim"
" vertical split instead of the default horizontal
" let g:neoterm_default_mod= "rightbelow"

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

" fzf
call minpac#add('junegunn/fzf.vim')
" Load FZF from homebrew installation
set runtimepath^=/usr/local/opt/fzf
runtime plugin/fzf.vim

" install last
call minpac#add('ryanoasis/vim-devicons')

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
nnoremap <leader>b :Bu<CR>

let g:airline_theme="gruvbox"
let g:airline_powerline_fonts = 1
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
nnoremap <Leader>p :Files<CR>
command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

function! SetupCommandAlias(input, output)
  exec 'cabbrev <expr> '.a:input
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
        \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperRg")

autocmd FileType qf nnoremap <guffer><silent> t :execute 'tabedit' matchstr(getline('.'), '^.\{-}\ze\|')<cr>

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
noremap <Leader>Tn :tabnew <bar> :Tnew<CR>
noremap <Leader>Ts :sp<bar> :Tnew<CR>

let g:neoterm_autoinsert = 1

" Git commands
command! -nargs=+ Tg :T git <args>

" prevent starting nested terminal in neovim
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replae all instances of it in the current file
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
" visual selection
xnoremap <Leader>r :s///gc<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" config coc
source $HOME/.config/nvim/coc.vimrc
source $HOME/.config/nvim/vista.vimrc

