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
    {
    'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            -- ref: https://coralpink.github.io/commentary/neovim/lsp/nvim-cmp.html
            require('mason-lspconfig').setup_handlers {
                function(server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = require('cmp_nvim_lsp').default_capabilities()
                    }
                end,
            }
        end,
    },
    { 'neovim/nvim-lspconfig' },
    { 'nvimtools/none-ls.nvim' },
    -- { 'nvimdev/lpasaga.nvim' },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
        },
        config = function()
            local cmp = require'cmp'

            cmp.setup({
              snippet = {
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                  vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                  -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                  -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                  -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                  -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
                end,
              },
              window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
              },
              mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              }),
              sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'vsnip' }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
              }, {
                { name = 'buffer' },
              })
            })

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            --[[ cmp.setup.filetype('gitcommit', {
              sources = cmp.config.sources({
                { name = 'git' },
              }, {
                { name = 'buffer' },
              })
            )
            equire("cmp_git").setup() ]]-- 

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
              mapping = cmp.mapping.preset.cmdline(),
              sources = {
                { name = 'buffer' }
              }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
              mapping = cmp.mapping.preset.cmdline(),
              sources = cmp.config.sources({
                { name = 'path' }
              }, {
                { name = 'cmdline' }
              }),
              matching = { disallow_symbol_nonprefix_matching = false }
            })

            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
            --   capabilities = capabilities
            -- }
        end,
    },
}
