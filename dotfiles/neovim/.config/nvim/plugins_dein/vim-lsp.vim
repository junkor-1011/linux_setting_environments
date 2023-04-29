" TMP
nnoremap <Leader>h :LspHover <CR>

" because of using ale, disable some function
" let g:lsp_diagnostics_enabled = 0         " disable diagnostics support
"
let g:lsp_highlights_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1

let s:lsp_log_file_dir = $XDG_DATA_HOME.'/vim-lsp'
if !isdirectory(s:lsp_log_file_dir)
  call mkdir(s:lsp_log_file_dir, 'p')
endif
let g:lsp_log_file = expand(s:lsp_log_file_dir.'/vim-lsp.log')
let g:lsp_log_verbose = 0

" efm-langserver
let $PATH = $PATH.':'.$HOME.'/go/bin:'.$XDG_DATA_HOME.'/vim-lsp-settings/servers/efm-langserver'

let s:efm_log_file_dir = $XDG_DATA_HOME.'/efm-langserver'
if !isdirectory(s:efm_log_file_dir)
  call mkdir(s:efm_log_file_dir, 'p')
endif

let g:lsp_settings = {
      \ 'efm-langserver': {
      \   'disabled': v:false
      \ }
      \ }
augroup LspEFM
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'efm-langserver',
      \ 'cmd': {server_info->['efm-langserver', '-c='.$HOME.'/.config/efm-langserver/config.yaml', '-logfile='.s:efm_log_file_dir.'/efm-langserver.log']},
      \ 'allowlist': ['vim', 'sh', 'dockerfile', 'markdown', 'rst', 'yaml', 'json', 'html', 'css', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'prisma'],
      \ })
augroup END

" let g:lsp_textprop_enabled = 0
" let g:lsp_virtual_text_enabled = 0

" for typescript by diagnostic-languageserver
" autocmd! vimrc User lsp_setup call lsp#register_server({
"     \   'name': 'diagnostic-languageserver',
"     \   'cmd': { info -> ['diagnostic-languageserver', '--stdio'] },
"     \   'whitelist': [
"     \     'typescript',
"     \     'typescript.tsx',
"     \     'typescriptreact',
"     \     'javascript',
"     \     'javascript.jsx',
"     \     'javascriptreact',
"     \   ],
"     \   'initialization_options': {
"     \     'linters': {
"     \       'eslint': {
"     \         'sourceName': 'eslint',
"     \         'command': 'eslint_d',
"     \         'args': ['--stdin', '--stdin-filename=%filename', '--no-color'],
"     \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
"     \         'formatLines': 1,
"     \         'formatPattern': [
"     \           '^\s*(\d+):(\d+)\s+([^ ]+)\s+(.*?)\s+([^ ]+)$',
"     \           {
"     \             'line': 1,
"     \             'column': 2,
"     \             'message': [4, ' [', 5, ']' ],
"     \             'security': 3
"     \           }
"     \         ],
"     \         'securities': {
"     \            'error': 'error',
"     \            'warning': 'warning'
"     \         },
"     \       },
"     \     },
"     \     'filetypes': {
"     \       'javascript': 'eslint',
"     \       'javascript.tsx': 'eslint',
"     \       'javascriptreact': 'eslint',
"     \       'typescript': 'eslint',
"     \       'typescript.tsx': 'eslint',
"     \       'typescriptreact': 'eslint',
"     \     },
"     \     'formatters': {
"     \       'eslint': {
"     \         'rootPatterns': ['.eslintrc', '.eslintrc.js'],
"     \         'command': 'eslint_d',
"     \         'args': ['--fix', '--fix-to-stdout', '--stdin', '--stdin-filename=%filename'],
"     \         'isStdout': v:true,
"     \         'isStderr': v:true,
"     \       }
"     \     },
"     \     'formatFiletypes': {
"     \       'javascript': 'eslint',
"     \       'javascript.tsx': 'eslint',
"     \       'javascriptreact': 'eslint',
"     \       'typescript': 'eslint',
"     \       'typescript.tsx': 'eslint',
"     \       'typescriptreact': 'eslint'
"     \     }
"     \   }
"     \ })
