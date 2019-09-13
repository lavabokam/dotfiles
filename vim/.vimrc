" set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


let mapleader = ';'
set backspace=indent,eol,start

set nocompatible              " be iMproved, required
filetype off                  " required
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
" set autochdir
set confirm
set ignorecase
set smartcase
set incsearch
" set hlsearch
set splitbelow
set splitright
syntax on

colorscheme slate
set wildignore+=*/.git/*,*/node_modules/*,*/bower_components/*,*/bld/*,*/bldr/*,*/thirdparty/*
set path+=**

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

 Plugin 'VundleVim/Vundle.vim'
 Plugin 'tpope/vim-fugitive'
 Plugin 'tpope/vim-eunuch'
 Plugin 'tpope/vim-surround'
 Plugin 'tpope/vim-commentary'
 Plugin 'airblade/vim-gitgutter'
 Plugin 'benmills/vimux'
 Plugin 'christoomey/vim-tmux-navigator'
 Plugin 'junegunn/vim-easy-align'
 Plugin 'ludovicchabant/vim-gutentags'
 Plugin 'jpalardy/vim-slime'
 Plugin 'godlygeek/tabular'
 Plugin 'plasticboy/vim-markdown'

 " Plugin 'chrisbra/csv.vim'
 " Plugin 'vim-airline/vim-airline'
 " Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required
filetype plugin indent on    " required

" tags
:set tags=./tags,tags;
" set nu
" set mouse=a


let g:airline_theme='dark_minimal'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let g:ctrlp_user_command = 'ag -l --nocolor -g "" %s'
  let g:ctrlp_use_caching = 0
endif


" Leader key mapping
noremap <Leader>q :q!<CR>
noremap <Leader>x :close<CR>
noremap <Leader>w :w!<CR>
noremap <Leader>e :e
noremap <Leader>a :Ack 
noremap <Leader>g :Git  
noremap <Leader>f :CtrlP<CR>
noremap <Leader>F :CtrlPMixed<CR>
noremap <Leader>/ :Commentary<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>V :split<CR>
noremap <Leader>c :bnext<CR>
noremap <Leader>C :bprevious<CR>
map <Leader>vp :VimuxPromptCommand<CR>
imap <C-g> <Esc>
noremap <C-g> <Esc>
map <C-/> :Commentary<CR>

" noremap <C-p> :CtrlPMixed<CR>
" vim fugitive mappings
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd :Gdiff<CR>
map <Leader>ghs :GitGutterStageHunk<CR>
map <Leader>gco :Git checkout 
autocmd FileType fugitive noremap <buffer> <silent> dt 0wv$hy:tabedit <C-r>"<CR>:Gdiff<CR><C-w>l


autocmd StdinReadPre * let s:std_in=1
let g:vim_markdown_folding_disabled = 1

" netrw
" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 20
" let g:netrw_chgwin=1
let g:netrw_localrmdir='rm -rf'

map <Leader>n  :Explore<CR>
" slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()
let g:slime_default_config = { "socket_name": get(split($TMUX, ","), 0), "target_pane": "{right-of}"}

" Vim8.1 terminal
" map <C-T> :vertical terminal<CR><C-w>L<CR>
noremap <Leader>t :vertical terminal<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_height = 90
let g:ctrlp_max_depth = 40
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:90,results:90'

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell
