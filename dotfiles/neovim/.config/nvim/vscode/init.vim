" init.vim for vscode-neovim
" exist('vscode')で処理分岐しても良いが、多くの設定は使わないため新規で書いておく

set encoding=utf-8

set fileformats=unix,dos,mac

set mouse=a

set ignorecase
set smartcase
set wrapscan
set hls
set showmatch

set autoindent
set smartindent
set cindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set splitright

set diffopt+=vertical

set termguicolors

" 不可視文字
" defaultでは非表示, `set list / set nolist`で表示切り替え
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set nolist

" customize keymap------------------------

" Leader
let mapleader = "\<Space>"

" save file
nnoremap <Leader>w :w<CR>

" system clipboard
" vmap <Leader>y "+y
" vmap <Leader>d "+d
" nmap <Leader>p "+p
" nmap <Leader>P "+P
" vmap <Leader>p "+p
" vmap <Leader>P "+P
" vscode上だと↑でうまく共有出来ない
" ToDo: clipboard共有設定(WSL, ssh-remote)


" visual line
nmap <Leader><Leader> V

" buffer
" ※あまり意味は無い
nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>bd :bdelete<CR>

" No Yank by 'x'
vnoremap x "_x
nnoremap x "_x

" No Ex-Mode
nnoremap Q gq


" moving
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" settings
source ~/.config/nvim/myutils/mappings.rc.vim
source ~/.config/nvim/myutils/options.rc.vim
source ~/.config/nvim/myutils/filetype.rc.vim
source ~/.config/nvim/myutils/autocmd.rc.vim
