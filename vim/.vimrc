" set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


let mapleader = ';'
set backspace=indent,eol,start

set nocompatible              " be iMproved, required
set encoding=utf-8

set wrap
set wildmenu
" set visualbell
set history=50
set undolevels=1000
set ruler
set showcmd
set showmatch
set showmode
set textwidth=0
set autochdir
set confirm
set ignorecase
set smartcase
set incsearch
" set hlsearch
set splitbelow
set splitright
syntax on

set bg=dark
set wildignore+=*/.git/*,*/node_modules/*,*/bower_components/*,*/thirdparty/*
set path+=**

" tags
:set tags=./tags,tags;
set nu
" set mouse=a

set background=dark
set encoding=utf-8
" set undodir=~/.vim/undo//
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swp//
" set swapfile backup undofile

filetype plugin indent on
syntax on
colorscheme koehler


noremap <Leader>q :q!<CR>
noremap <Leader>x :close<CR>
noremap <Leader>w :w!<CR>
noremap <Leader>e :e
noremap <Leader>a :Ack 
noremap <Leader>g :Git  
noremap <Leader>v :vsplit<CR>
noremap <Leader>V :split<CR>
noremap <Leader>c :bnext<CR>
noremap <Leader>C :bprevious<CR>
noremap <Leader>s :set spell!<CR>
imap <C-g> <Esc>
noremap <C-g> <Esc>
map <C-/> :Commentary<CR>

" vim fugitive mappings

autocmd StdinReadPre * let s:std_in=1
let g:vim_markdown_folding_disabled = 1

" netrw
"" netrw file browser settings
let g:netrw_banner=0		" Hide the directory banner
let g:netrw_liststyle=3		" 0=thin; 1=long; 2=wide; 3=tree
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 20
" let g:netrw_chgwin=1
let g:netrw_localrmdir='rm -rf'

" map <C-T> :vertical terminal<CR><C-w>L<CR>
noremap <Leader>t :vertical terminal<CR>
tnoremap <Esc> <C-\><C-N>
noremap <Leader>= :vertical resize 80<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



" Column 
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Folding
" set foldmethod=syntax

" au BufWinLeave * mkview
" au BufWinEnter * silent loadview
au BufNewFile,BufRead Jenkinsfile setf groovy
au BufNewFile,BufRead *.Jenkinsfile setf groovy
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

