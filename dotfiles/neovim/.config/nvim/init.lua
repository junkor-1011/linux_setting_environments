local function source_vim_file(filepath)
    local expanded_path = vim.fn.expand(filepath)
    if vim.fn.filereadable(expanded_path) == 1 then
        vim.cmd("source " .. expanded_path)
    else
        vim.notify("File not found: " .. expanded_path, vim.log.levels.WARN)
    end
end

-- ~/.config/nvim/myutils/before_colorscheme.vim を条件付きで読み込む
local before_colorscheme = vim.fn.expand("~/.config/nvim/myutils/before_colorscheme.vim")
if vim.fn.filereadable(before_colorscheme) == 1 then
    vim.cmd("source " .. before_colorscheme)
end
vim.cmd("colorscheme default")

vim.opt.number = true
-- vim.opt.clipboard = "unnamed"

vim.opt.encoding = "utf-8"

vim.opt.fileformats = { "unix", "dos", "mac" }

vim.opt.mouse = "a"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.showmatch = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.splitright = true
vim.opt.diffopt:append("vertical")
vim.opt.termguicolors = true

-- 不可視文字の設定
-- 初期状態でリストモードをオフにし、`set list / set nolist`で切り替え可能
vim.opt.list = false
vim.opt.listchars = {
    tab = "»-",       -- タブ文字
    trail = "-",      -- 行末の空白
    eol = "↲",        -- 行末記号
    extends = "»",    -- 表示範囲を超えた文字
    precedes = "«",   -- 範囲の前にある文字
    nbsp = "%"        -- ノーブレークスペース
}

-- カスタムキーマッピング ------------------------

-- Leader Key
vim.g.mapleader = " " -- <Space>をLeaderキーに設定

-- save file
vim.keymap.set("n", "<Leader>w", ":w<CR>", { noremap = true, silent = true })

-- system clipboard
vim.keymap.set("v", "<Leader>y", '"+y', { noremap = true })
vim.keymap.set("v", "<Leader>d", '"+d', { noremap = true })
vim.keymap.set("n", "<Leader>p", '"+p', { noremap = true })
vim.keymap.set("n", "<Leader>P", '"+P', { noremap = true })
vim.keymap.set("v", "<Leader>p", '"+p', { noremap = true })
vim.keymap.set("v", "<Leader>P", '"+P', { noremap = true })

-- visual line
vim.keymap.set("n", "<Leader><Leader>", "V", { noremap = true })

-- buffer
vim.keymap.set("n", "<Leader>bp", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bf", ":bfirst<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bl", ":blast<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>bd", ":bdelete<CR>", { noremap = true, silent = true })

-- No Yank by 'x'
vim.keymap.set("v", "x", '"_x', { noremap = true })
vim.keymap.set("n", "x", '"_x', { noremap = true })

-- No Ex-Mode
vim.keymap.set("n", "Q", "gq", { noremap = true })

-- カーソル移動のカスタマイズ
vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })
vim.keymap.set("n", "gj", "j", { noremap = true })
vim.keymap.set("n", "gk", "k", { noremap = true })

vim.cmd [[
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
]]

-- ファイル読み込み後、カーソル位置を復元するAutoCmdグループ
vim.api.nvim_create_augroup("vimrcEx", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
    group = "vimrcEx",
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd("normal g`\"")
        end
    end,
})

-- diagnostic config
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

require("config.lazy")

source_vim_file("~/.config/nvim/myutils/mappings.rc.vim")
source_vim_file("~/.config/nvim/myutils/options.rc.vim")
source_vim_file("~/.config/nvim/myutils/filetype.rc.vim")
source_vim_file("~/.config/nvim/myutils/autocmd.rc.vim")
