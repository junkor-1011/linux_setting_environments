

" FullWidthSpace -----------------------------------------------------------
" ref: https://qiita.com/tmsanrinsha/items/d6c11f2b7788eb24c776
" ref: https://qiita.com/callmekohei/items/765c2fe9fd7fc2834193
augroup MyVimrc
    autocmd!
augroup END

augroup MyVimrc
    autocmd ColorScheme * highlight UnicodeSpaces cterm=underline ctermfg=59 ctermbg=16 gui=underline guifg=#465457 guibg=#000000
    autocmd VimEnter,WinEnter * match UnicodeSpaces /\%u180E\|\%u2000\|\%u2001\|\%u2002\|\%u2003\|\%u2004\|\%u2005\|\%u2006\|\%u2007\|\%u2008\|\%u2009\|\%u200A\|\%u2028\|\%u2029\|\%u202F\|\%u205F\|\%u3000/
augroup END

command! -range=% FixSpaces call <SID>fix_spaces(<line1>, <line2>)

function! s:fix_spaces(line1, line2)
    " Save the current search and cursor position
    let _s=@/
    let l = line('.')
    let c = col('.')

    " Trim trailing spaces
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//e'

    " Replace unicode spaces to normal space
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\%u00A0\|\%u180E\|\%u2000\|\%u2001\|\%u2002\|\%u2003\|\%u2004\|\%u2005\|\%u2006\|\%u2007\|\%u2008\|\%u2009\|\%u200A\|\%u2028\|\%u2029\|\%u202F\|\%u205F\|\%u3000/ /ge'

    " Restore the saved search and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

command! TrimEnd call s:trimEnd()
function! s:trimEnd() abort

    " mark origin position
    :normal! ma

    let l:range = '%'

    let l:unicodeSpaces = '\v' .
                \ '%u180E|%u2028|%u2029|%u00A0|%u2000|%u2001|' .
                \ '%u2002|%u2003|%u2004|%u2005|%u2006|%u2007|' .
                \ '%u2008|%u2009|%u200A|%u202F|%u205F|%u3000'

    let l:space = '\v\s'

    " Trim end spaces
    :execute l:range 'substitute' '/\v(' . l:unicodeSpaces . '|' . l:space . ')+$//ge'

    " back to origin position
    :normal! `a

endfunction


