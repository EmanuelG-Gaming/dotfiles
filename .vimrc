" Vim config.

syntax on

" Leader key.
let g:mapleader = ' '
let g:localmapleader = ' '

" Search options.
set ignorecase
set smartcase
set hlsearch
set incsearch


" Behaviour of the buffer.
"set inccommand=split
set signcolumn=yes
set nocursorcolumn
set nowrap

" Tabs/indentation.
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smartindent " Smart auto-identing.
set autoindent " Copy ident from current line.

set mouse=a

" Line numbers
set number
set relativenumber
set nocursorline

" Stylistic choices.
set termguicolors " 24-bit colors.
"set winborder=rounded
set lazyredraw " Don't redraw during macros.
set showmatch " Highlight matching brackets.
set matchtime=2 " How long to show a matching bracket.

" Buffer splitting behaviour.
set splitbelow
set splitright

" Scrolloff
set scrolloff=10
set sidescrolloff=8

" Opt list.
" This would add the '$' symbols at the end of each line.
set nolist

" File handling.
set nobackup
set nowritebackup
set noswapfile
set undofile " Persistent undo.
"set undodir = vim.fn.expand("~/.config/vim/undo")
set updatetime=300
set autoread
set noautowrite

" Netrw settings.
" Netrw is Vim's default file manager.
let g:netrw_banner = 0 " Hide annoying banner.
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_liststyle = 3 " Tree style.
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" Sync OS and Vim keyboard.
"vim.schedule(function()
"   vim.opt.clipboard = "unnamedplus"
"end)

" Shout out (:so)
" nmap - normal mode mapping
" vmap - visual mode
" xmap - insert mode
nmap <leader>o :update<CR> :source<CR>

" Better J behaviour.
nmap J mzJ z

" Alt key.
" Normal mode.
nmap <A-j> :m .+1<CR>==
nmap <A-k> :m .-2<CR>==

" Visual mode.
vmap <A-J> :m '>+1<CR>gv=gv
vmap <A-k> :m '<-2<CR>gv=gv

" Better visual mode indenting.
vmap < <gv
vmap > >gv

" QWE keys (for faster file IO I think).
nmap <leader>w :write<CR>
nmap <leader>q :quit<CR>

" Quick.

" Window splitting.
nmap <leader>sw :vsplit<CR>
nmap <leader>sh :split<CR>

" Buffer navigation.
nmap <leader>bn :bnext<CR>
nmap <leader>bp :bprevious<CR>

" Better window navigation.
nmap <C-h> <C-w><C-h>
nmap <C-l> <C-w><C-l>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>

" Center screen when jumping.
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz>
nmap <C-f> <C-f>zz
nmap <C-b> <C-b>zz

" Next search result (centered).
nmap n nzzzv
" Previous search result (centered).
nmap N Nzzzv

" Quick config editing.
nmap <leader>cf :e ~/.vimrc<CR>

" nmap <leader>lf

" Netrw.
" Netrw is Vim's built-in file browser.
" nmap <Tab> :tabedit %:p<CR>

nmap <Tab> :Lexplore<CR>


" Remove highlighted words after search.
" WARN: There seems to be a bug in Vim
" where calling the same key the would cause a recursive descent,
" which makes the application freeze and the fans spin, unless you manually exit the editor.
" nmap <Esc> :nohlsearch<CR><Esc>
nmap <Esc> :nohlsearch<CR>

" Ctags editing.
nnoremap <leader>ew :tab split<CR> :exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>eh :vsplit<CR>:exec("tag".expand("<cword>"))<CR>

" Jump to definition in a horizontal split.
nnoremap <leader>s :split<CR>:exec("tag ".expand("<cword>"))<CR>

" Preview definition (opens in preview window).
nnoremap <leader>p :pedit <C-r>=tagfile()<CR><CR>:exec("tag ".expand("<cword>"))<CR>

" List all reference to the symbol under cursor.
nnoremap <leader>r :execute "grep -n".expand("<cword>"). " ."<CR>


" Color scheme.
let g:borlandp_bg = "dark_blue"
colorscheme borlandp

":hi statusline guibg=NONE
set completeopt+=noselect
