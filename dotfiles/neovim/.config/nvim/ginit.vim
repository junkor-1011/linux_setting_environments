if exists("g:GuiLoaded")
    GuiTabline 0
    GuiPopupmenu 0
    " GuiLinespace 2
    " GuiFont! Hack\ NF:h10:l
endif

if exists("g:neovide")
    " disable animation
    let g:neovide_cursor_animation_length = 0
endif
