return {
    'williamboman/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'williamboman/mason.nvim',
        {
            'neovim/nvim-lspconfig',
        },
        'ray-x/lsp_signature.nvim',
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        require('mason-lspconfig').setup()

        -- Setup lspconfig for cmp
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        local function on_attach(client, bufnr)
            require('lsp_signature').on_attach({}, bufnr)

            -- use lspsaga for most lsp keymaps
            -- LSP config mappings{{{
            local key_opts = { silent = true, buffer = bufnr }
            vim.keymap.set('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', key_opts)
            vim.keymap.set('n', '<leader>l', '<cmd>lua vim.diagnostic.setloclist()<CR>', key_opts)
            -- }}}
        end

        require('mason-lspconfig').setup_handlers({
            function(server_name)
                require('lspconfig')[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,

            ['gopls'] = function()
                require('lspconfig').gopls.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                        },
                    },
                })
            end,

            ['ruff'] = function()
                require('lspconfig').ruff.setup({
                    on_attach = function(client, bufnr)
                        client.server_capabilities.hoverProvider = false
                        on_attach(client, bufnr)
                    end,
                })
            end,
            ['basedpyright'] = function()
                require('lspconfig').basedpyright.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    -- https://github.com/amitds1997/dotfiles/blob/main/dot_config/nvim/lua/plugins/lsp-config/basedpyright.lua
                    settings = {
                        basedpyright = {
                            disableOrganizeImports = true,
                            disableTaggedHints = false,
                            analysis = {
                                typeCheckingMode = 'basic',
                                autoImportCompletions = true,
                                autoSearchPaths = true,
                                diagnosticSeverityOverrides = {
                                    reportIgnoreCommentWithoutRule = true,
                                },
                            },
                        },
                    },
                })
            end,

            -- Configure lua language server for neovim development
            ['lua_ls'] = function()
                require('lspconfig').lua_ls.setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = 'LuaJIT',
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { 'vim' },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files
                                library = vim.api.nvim_get_runtime_file('', true),
                                checkThirdParty = false,
                            },
                            -- Do not send telemetry data containing a randomized but unique identifier
                            telemetry = {
                                enable = false,
                            },
                        },
                    },
                })
            end,
        })
    end,
}
