set tabstop=4
set softtabstop=4
set shiftwidth=4
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
set autochdir
set confirm
set ignorecase
set smartcase
set incsearch
" set hlsearch

" set splitbelow
			
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'w0rp/ale'
call vundle#end()            " required
filetype plugin indent on    " required

" tags
:set tags=./tags,tags;

set nu
set mouse=a

syntax on
"ALe

let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:airline#extensions#ale#enabled = 1


" you complete me
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/youcompleteme/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Disapble Arrow Keys
" noremap <Up> <Nop> 
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>

let g:airline_theme='dark_minimal'

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Leader key mapping
noremap <Leader>q :q<CR>
noremap <Leader>x :close<CR>
noremap <Leader>w :w!<CR>
noremap <Leader>e :e
noremap <Leader>f :CtrlP<CR>
noremap <Leader>F :CtrlPMixed<CR>
noremap <Leader>/ :Commentary<CR>
noremap <Leader>v :vsplit<CR>
noremap <Leader>V :split<CR>
noremap <Leader>c :bnext<CR>
noremap <Leader>C :bprevious<CR>
imap <C-g> <Esc>
noremap <C-g> <Esc>
map <C-/> :Commentary<CR>

noremap <C-p> :CtrlPMixed<CR>
" vim fugitive mappings
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd :Git diff<CR>
autocmd StdinReadPre * let s:std_in=1

" netrw
" let g:netrw_banner = 0
let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 20
" let g:netrw_chgwin=1
" let g:netrw_localrmdir='rm -rf'

map <Leader>n  :Vexplore<CR>

" Vim8.1 terminal
map <C-t> :vertical terminal<CR><C-w>L<CR>
noremap <Leader>t :terminal<CR>

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
