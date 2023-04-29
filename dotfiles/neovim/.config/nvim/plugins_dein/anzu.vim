" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)


" clear status
" 再度nやNを押すとまた検索が始まってしまうので、その辺りも改善したい
nmap <silent><Esc><Esc> <Plug>(anzu-clear-search-status) :nohlsearch<CR>


" statusline
set statusline=%{anzu#search_status()}
