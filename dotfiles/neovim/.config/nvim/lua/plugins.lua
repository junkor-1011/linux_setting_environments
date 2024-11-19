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
    -- { 'vim-denops/denops.vim' },
    { 'luochen1990/rainbow' },
    { 'ryanoasis/vim-devicons' },
    { 'editorconfig/editorconfig-vim' },
    -- {
    --     'airblade/vim-gitgutter',
    --     config = function()
    --         vim.cmd("nmap ]g <Plug>(GitGutterNextHunk)")
    --         vim.cmd("nmap [g <Plug>(GitGutterPrevHunk)")
    --     end,
    -- },
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup {
                word_diff = true,
                on_attach = function(bufnr)
                    local gitsigns = require('gitsigns')

                    local function map(mode, l, r, opts)
                      opts = opts or {}
                      opts.buffer = bufnr
                      vim.keymap.set(mode, l, r, opts)
                    end

                    map('n', ']g', function()
                      if vim.wo.diff then
                        vim.cmd.normal({']g', bang = true})
                      else
                        gitsigns.nav_hunk('next')
                      end
                    end)

                    map('n', '[g', function()
                      if vim.wo.diff then
                        vim.cmd.normal({'[g', bang = true})
                      else
                        gitsigns.nav_hunk('prev')
                      end
                    end)

                    vim.api.nvim_create_user_command(
                        'StageHunk',
                        function()
                            gitsigns.stage_hunk()
                        end,
                        {}
                    )
                    vim.api.nvim_create_user_command(
                        'ResetHunk',
                        function()
                            gitsigns.reset_hunk()
                        end,
                        {}
                    )
                    vim.api.nvim_create_user_command(
                        'UndoStageHunk',
                        function()
                            gitsigns.undo_stage_hunk()
                        end,
                        {}
                    )
                end,
            }
        end,
    },
    { 'tpope/vim-fugitive' },
    {
        'iberianpig/tig-explorer.vim',
        lazy = true,
        cmd = {
            'TigStatus',
            'TigOpenCurrentFile',
        },
    },
    {
        'rhysd/git-messenger.vim',
        lazy = true,
        cmd = {
            'GitMessenger',
        },
    },
    {
        'Yggdroot/indentLine',
        -- lazy = true,
        -- cmd = {
        --     'IndentLinesToggle',
        -- },
        config = function()
            vim.cmd [[
                nnoremap <silent> <Leader>i :<C-u>IndentLinesToggle<CR>
            ]]
        end,
    },
    {
        'nicwest/vim-camelsnek',
        cmd = {
            'Camel',
            'CamelB',
            'Snek',
            'Kebab',
        },
    },
    {
        'junegunn/vim-easy-align',
        cmd = { 'EasyAlign' },
        config = function()
            vim.cmd [[
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
            ]]
        end,
    },
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
            require('Comment').setup()
            local esc = vim.api.nvim_replace_termcodes(
                '<ESC>', true, false, true
            )
            vim.keymap.set('n', '<C-_>', function() require('Comment.api').toggle.linewise.current() end, { noremap = true, silent = true })
            vim.keymap.set('x', '<C-_>', function()
                vim.api.nvim_feedkeys(esc, 'nx', false)
                require('Comment.api').toggle.linewise(vim.fn.visualmode())
            end)
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
            -- 'lua',
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
        'neovim/nvim-lspconfig',
        config = function()
            -- Global mappings.
            -- See `:help vim.diagnostic.*` for documentation on any of the below functions
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd('LspAttach', {
              group = vim.api.nvim_create_augroup('UserLspConfig', {}),
              callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }

                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<Leader>h', vim.lsp.buf.hover, opts) -- custom
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<space>wl', function()
                  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<space>f', function()
                  vim.lsp.buf.format { async = true }
                end, opts)
                -- vim.keymap.set('n', '<Leader>f', function()
                --   vim.lsp.buf.format { async = true }
                -- end, opts)
                vim.api.nvim_create_user_command(
                    'Format',
                    function()
                        vim.lsp.buf.format { async = true }
                    end,
                    {}
                )
              end,
            })
        end,
    },
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {
                progress = {
                    display = {
                        progress_icon = { pattern = 'meter', period = 1 }
                    }
                }
            }
        end,
    },
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim',
            'jayp0521/mason-null-ls.nvim',
        },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            -- avoid conflict deno & node
            local lspconfig = require('lspconfig')

            local function is_node_project()
                return lspconfig.util.root_pattern("package.json")(vim.fn.getcwd()) ~= nil
            end

            local function is_deno_project()
                return lspconfig.util.root_pattern("deno.json", "deno.jsonc")(vim.fn.getcwd()) ~= nil
            end

            -- ref: https://coralpink.github.io/commentary/neovim/lsp/nvim-cmp.html
            require('mason-lspconfig').setup_handlers {
                function(server_name)
                    if server_name == 'ts_ls' then
                        if is_node_project() and (not is_deno_project()) then
                            require('lspconfig')[server_name].setup {
                                capabilities = require('cmp_nvim_lsp').default_capabilities()
                            }
                        end
                    elseif server_name == 'biome' then
                        if is_node_project() and (not is_deno_project()) then
                            require('lspconfig')[server_name].setup {
                                capabilities = require('cmp_nvim_lsp').default_capabilities()
                            }
                        end
                    elseif server_name == 'denols' then
                        if not is_node_project() then
                            require('lspconfig')[server_name].setup {
                                capabilities = require('cmp_nvim_lsp').default_capabilities()
                            }
                        end
                    else
                        require('lspconfig')[server_name].setup {
                            capabilities = require('cmp_nvim_lsp').default_capabilities()
                        }
                    end
                end,
            }
        end,
    },
    {
        'nvimtools/none-ls.nvim',
        config = function()
            local null_ls = require('null-ls')

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.completion.spell,
                },
            })
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            require('lspsaga').setup({
                lightbulb = {
                    enable = false,
                    -- sign = false,
                },
            })
            vim.api.nvim_create_user_command(
                'LspShowBufferDiagnostics',
                function()
                    vim.cmd("Lspsaga show_buf_diagnostics")
                end,
                {}
            )
            vim.api.nvim_create_user_command(
                'LspShowWorkspaceDiagnostics',
                function()
                    vim.cmd("Lspsaga show_workspace_diagnostics")
                end,
                {}
            )
            vim.api.nvim_create_user_command(
                'LspCodeAction',
                function()
                    vim.cmd("Lspsaga code_action")
                end,
                {}
            )
            vim.keymap.set("n", "<Leader>a", function ()
                vim.cmd("Lspsaga code_action")
            end, { desc = "Run :Lspsaga code_action" })
        end,
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
            "hrsh7th/vim-vsnip",
            "hrsh7th/vim-vsnip-integ",
            "hrsh7th/cmp-vsnip"
            -- "SirVer/ultisnips",
        },
        config = function()
            local cmp = require'cmp'
            local has_words_before = function()
              local line, col = unpack(vim.api.nvim_win_get_cursor(0))
              return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end
            local feedkey = function(key, mode)
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

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
                 -- Tab Completion
                ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  -- elseif luasnip.expand_or_jumpable() then
                  --   luasnip.expand_or_jump()
                  elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                  elseif has_words_before() then
                    cmp.complete()
                  else
                    fallback()
                  end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  -- elseif luasnip.jumpable(-1) then
                  --   luasnip.jump(-1)
                  elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                  else
                    fallback()
                  end
                end, { "i", "s" }),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
              }),
              sources = cmp.config.sources({
                { name = 'nvim_lsp', priority = 500 },
                { name = 'path', priority = 250 },
                { name = 'buffer', priority = 100 },
                { name = 'vsnip', priority = 200 }, -- For vsnip users.
                -- { name = 'luasnip' }, -- For luasnip users.
                -- { name = 'ultisnips' }, -- For ultisnips users.
                -- { name = 'snippy' }, -- For snippy users.
              }, {
                { name = 'buffer' },
                { name = 'cmdline' },
              })
            })

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            -- [[ cmp.setup.filetype('gitcommit', {
            --   sources = cmp.config.sources({
            --     { name = 'git' },
            --   }, {
            --     { name = 'buffer' },
            --   })
            -- )
            -- require("cmp_git").setup() ]] 

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

            -- lspkind
            local lspkind = require('lspkind')
            cmp.setup {
                formatting = {
                    format = lspkind.cmp_format({
                        -- mode = 'symbol', -- show only symbol annotations
                        maxwidth = {
                            -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                            -- can also be a function to dynamically calculate max width such as
                                -- menu = function() return math.floor(0.45 * vim.o.columns) end,
                                menu = 50, -- leading text (labelDetails)
                                abbr = 50, -- actual suggestion item
                            },
                            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                            show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                            -- The function below will be called before any actual modifications from lspkind
                                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                                before = function (entry, vim_item)
                                    -- ...
                                    return vim_item
                                end
                            })
                }
            }
            -- lspkind end
        end,
    },
}
