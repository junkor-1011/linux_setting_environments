" map
" Toggle
nnoremap <silent> <Leader>o :<C-u>Vista!!<CR>

let g:vista_default_executive = 'vim_lsp'
let g:vista_finder_alternative_executives = ['ctags']
" vista icon
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1


" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }
" 特殊文字の表示に失敗するため、全て空文字に変えておく
let g:vista#renderer#icons = {
            \ 'func':           "",
            \ 'function':       "",
            \ 'functions':      "",
            \ 'var':            "",
            \ 'variable':       "",
            \ 'variables':      "",
            \ 'const':          "",
            \ 'constant':       "",
            \ 'method':         "",
            \ 'package':        "",
            \ 'packages':       "",
            \ 'enum':           "",
            \ 'enumerator':     "",
            \ 'module':         "",
            \ 'modules':        "",
            \ 'type':           "",
            \ 'typedef':        "",
            \ 'types':          "",
            \ 'field':          "",
            \ 'fields':         "",
            \ 'macro':          "",
            \ 'macros':         "",
            \ 'map':            "",
            \ 'class':          "",
            \ 'augroup':        "",
            \ 'struct':         "",
            \ 'union':          "",
            \ 'member':         "",
            \ 'target':         "",
            \ 'property':       "",
            \ 'interface':      "",
            \ 'namespace':      "",
            \ 'subroutine':     "",
            \ 'implementation': "",
            \ 'typeParameter':  "",
            \ 'default':        ""
            \ }
