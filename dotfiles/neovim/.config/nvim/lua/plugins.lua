return {
    {
        'vim-airline/vim-airline',
        lazy = false,
        priority = 1000,
        dependencies = {
            'vim-airline/vim-airline-themes',
        },
        config = function()
            vim.cmd("source " .. "~/.config/nvim/plugins_dein/vim-airline.vim")
            vim.cmd("let g:airline_theme = 'simple'")
        end,
    },
    { 'vim-denops/denops.vim' },
    { 'luochen1990/rainbow' },
    { 'ryanoasis/vim-devicons' },
    { 'editorconfig/editorconfig-vim' },
    {
        'airblade/vim-gitgutter',
        config = function()
            vim.cmd("nmap ]g <Plug>(GitGutterNextHunk)")
            vim.cmd("nmap [g <Plug>(GitGutterPrevHunk)")
        end,
    },
    { 'tpope/vim-fugitive' },
    {
        'osyo-manga/vim-anzu',
        lazy = true,
        config = function()
            vim.cmd("source " .. "~/.config/nvim/plugins_dein/anzu.vim")
        end,
    },
    { 'tpope/vim-repeat' },
    { 'tpope/vim-surround' },
    { 'tpope/vim-endwise' },
    { 'tpope/vim-dispatch' },
    { 'jiangmiao/auto-pairs' },
    { 'sheerun/vim-polyglot' }, -- syntax
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            vim.keymap.set("n", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
            vim.keymap.set("x", "<C-_>", function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
        end,
    },
    -- {
    --     'tyru/caw.vim',
    --     lazy = false,
    --     config = function()
    --        vim.cmd("nmap <C-_> <Plug>(caw:hatpos:toggle)")
    --        vim.cmd("xmap <C-_> <Plug>(caw:hatpos:toggle)")
    --     end,
    -- },
    {
        'mattn/sonictemplate-vim',
        config = function()
            vim.cmd [[
let g:sonictemplate_vim_template_dir = '$HOME/.config/nvim/plugins_dein/sonictemplate'
            ]]
        end,
    },
    { 'kamykn/spelunker.vim' },
    {
        'pantharshit00/vim-prisma',
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('nvim-tree').setup {}
            vim.cmd [[
            nnoremap <silent> <Leader>d :<C-u> NvimTreeToggle <CR>
            ]]
        end,
    },
    -- { 'junegunn/fzf.vim' },
    {
        'junegunn/fzf.vim',
        dependencies = {
            'junegunn/fzf',
        },
    },
    { 'pbogut/fzf-mru.vim' },
    {
        'thinca/vim-quickrun',
        -- cmd = { 'QuickRun' },
        config = function()
            vim.cmd [[
    nnoremap <Leader>r :<C-U>QuickRun<CR>
    xnoremap <Leader>r gv:<C-U>QuickRun<CR>
            ]]
        end,
    },
    {
        'Shougo/context_filetype.vim',
        ft = {
            'html',
            'djangohtml',
            'markdown',
            'toml',
            'help',
        },
    },
    {
        'osyo-manga/vim-precious',
        dependencies = {
            'Shougo/context_filetype.vim',
        },
        ft = {
            'html',
            'djangohtml',
            'toml',
        },
    },
    {
        'Shougo/neco-vim',
        ft = { 'vim' },
    },
    {
        'ujihisa/neco-look',
        ft = {
            'gitcommit',
            'markdown',
        },
    },
    {
        'jmcantrell/vim-virtualenv',
        lazy = true,
        ft = { 'python' },
    },
}
