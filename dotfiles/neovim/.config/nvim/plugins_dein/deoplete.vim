
let g:deoplete#enable_at_startup = 1
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"
" in Windows, not works well.
" inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
if !has('win32') && !has('win64')
    " Linuxでも意図しない挙動を起こす可能性があるので注意する
    inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
endif

" vim-lsp
let s:use_lsp_sources = ['lsp', 'dictionary', 'file']

call deoplete#custom#option({
    \ 'auto_complete': v:true,
    \ 'min_pattern_length': 2,
    \ 'auto_complete_delay': 0,
    \ 'auto_refresh_delay': 20,
    \ 'refresh_always': v:true,
    \ 'smart_case': v:true,
    \ 'camel_case': v:true,
    \ })


let s:use_lsp_sources = ['lsp', 'dictionary', 'file']
" call deoplete#custom#option('sources', {
"     \ 'go': s:use_lsp_sources,
"     \ 'python': s:use_lsp_sources,
"     \ 'javascript': s:use_lsp_sources,
"     \ 'typescript': s:use_lsp_sources,
"     \ 'typescriptreact': s:use_lsp_sources,
"     \ 'vim': ['vim', 'buffer', 'dictionary', 'file'],
"     \})

" disable prev window
set completeopt-=preview
autocmd CompleteDone * silent! plose!
