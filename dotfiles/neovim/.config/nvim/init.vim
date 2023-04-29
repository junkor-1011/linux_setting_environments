" ~/.config/nvim/init.vim

" BASIC CONF
"colorscheme koehler
" colorschemeの設定前に必要な設定を実施
if filereadable(expand('~/.config/nvim/myutils/before_colorscheme.vim'))
    source ~/.config/nvim/myutils/before_colorscheme.vim
endif
colorscheme default
set number  " line number
"set clipboard=unnamed

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

" filetype setting
" augroup fileTypeIndent
"     autocmd!
"     autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
"     autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
"     autocmd BufNewFile,BufRead *.html setlocal tabstop=2 softtabstop=2 shiftwidth=2
"     autocmd BufNewFile,BufRead *.css setlocal tabstop=2 softtabstop=2 shiftwidth=2
" augroup END


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
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" visual line
nmap <Leader><Leader> V

" buffer
nnoremap <Leader>bp :bprev<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>bd :bdelete<CR>

" Emacs Keybind in InsertMode
" -> 意外とVimのkeybindと被ることが分かったので、多くのものは設定を断念



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


" define command--------------------------

" from Kaoriya-Commands ----------
" ref: https://nanasi.jp/articles/vim/cmdex_vim.html

" CdCurrent
command! -nargs=0 CdCurrent cd %:p:h
" VDsplit
command! -nargs=1 -complete=file VDsplit vertical diffsplit <args>
" :IminsertOff/On
command! -nargs=0 IminsertOff inoremap <buffer> <silent> <ESC> <ESC>:set iminsert=0<CR>
command! -nargs=0 IminsertOn iunmap <buffer> <ESC>
" :Scratch
"   Open a scratch (no file) buffer.
command! -nargs=0 Scratch new | setlocal bt=nofile noswf | let b:cmdex_scratch = 1
function! s:CheckScratchWritten()
  if &buftype ==# 'nofile' && expand('%').'x' !=# 'x' && exists('b:cmdex_scratch') && b:cmdex_scratch == 1
    setlocal buftype= swapfile
    unlet b:cmdex_scratch
  endif
endfunction
augroup CmdexScratch
autocmd!
autocmd BufWritePost * call <SID>CheckScratchWritten()
augroup END
" :Undiff
"   Turn off diff mode for current buffer.
command! -nargs=0 Undiff set nodiff noscrollbind wrap nocursorbind


" extra setting --------------------------

" memory last cursor position
" if has("autocmd")
"   augroup redhat
"     " In text files, always limit the width of text to 78 characters
"     autocmd BufRead *.txt set tw=78
"     " When editing a file, always jump to the last cursor position
"     autocmd BufReadPost *
"     \ if line("'"") &gt; 0 &amp;&amp; line ("'"") &lt;= line("$") |
"     \   exe "normal! g'"" |
"     \ endif
"   augroup END
" endif
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


" local setting
if filereadable(expand('~/.config/nvim/local_setting.vim'))
  source ~/.config/nvim/local_setting.vim
endif

"neovim backend --------------------------

" Python3
let s:python3_nvim_backend = getenv("PYTHON3_NVIM_BACKEND")
if s:python3_nvim_backend != v:null
    let g:python3_host_prog = s:python3_nvim_backend
endif
unlet s:python3_nvim_backend

" nodejs
let s:node_nvim_backend = getenv("NODE_NVIM_BACKEND")
if s:node_nvim_backend != v:null
    let g:node_host_prog = s:node_nvim_backend
endif
unlet s:node_nvim_backend

" ruby
let s:ruby_nvim_backend = getenv("RUBY_NVIM_BACKEND")
if s:ruby_nvim_backend != v:null
    let g:ruby_host_prog = s:ruby_nvim_backend
endif
unlet s:ruby_nvim_backend


"Start dein Scripts-----------------------------

" install
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set dein base path (required)
let s:dein_base = '~/.cache/dein/'

" Set dein source path (required)
let s:dein_src = '~/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set dein runtime path (required)
execute 'set runtimepath+=' .. s:dein_src

" Call dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" CUSTOM SETTING
" deinで無効化するものなどあれば
if filereadable(expand('~/.config/nvim/dein_disable.vim'))
    source ~/.config/nvim/dein_disable.vim
endif

if filereadable(expand('~/.config/nvim/before_dein.vim'))
    source ~/.config/nvim/before_dein.vim
endif

" use toml
call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

" remove trash (test)
call map(dein#check_clean(), "delete(v:val, 'rf')")

" Finish dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
if dein#check_install()
call dein#install()
endif
"End dein Scripts-------------------------

" settings
source ~/.config/nvim/myutils/mappings.rc.vim
source ~/.config/nvim/myutils/options.rc.vim
source ~/.config/nvim/myutils/filetype.rc.vim
source ~/.config/nvim/myutils/autocmd.rc.vim
