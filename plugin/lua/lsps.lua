-- remove diagnostic signs and only color numbers
vim.fn.sign_define("DiagnosticSignError", {text = "", numhl = "DiagnosticDefaultError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = "", numhl = "DiagnosticDefaultWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = "", numhl = "DiagnosticDefaultInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "", numhl = "DiagnosticDefaultHint"})

require'lsp_signature'.setup()

-- Setup lspconfig for cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function on_attach(client, bufnr)
    -- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end


    -- LSP config mappings{{{
    vim.g.mapleader = ','
    local key_opts = {silent=true, noremap=true}
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', key_opts)
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', key_opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', key_opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', key_opts)
    buf_set_keymap('n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', key_opts)
    -- vim.api.nvim_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', key_opts)
    buf_set_keymap('n', '<leader>rn', ':Lspsaga rename<CR>', key_opts)
    buf_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', key_opts)
    buf_set_keymap('n', 'cd', ':Lspsaga show_line_diagnostics<CR>', key_opts)
    -- vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', key_opts)
    buf_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', key_opts)
    buf_set_keymap('n', '[d', ':Lspsaga diagnostic_jump_prev<CR>', key_opts)
    buf_set_keymap('n', ']d', ':Lspsaga diagnostic_jump_next<CR>', key_opts)
    buf_set_keymap('n', '<leader>l', '<cmd>lua vim.diagnostic.setloclist()<CR>', key_opts)
    -- }}}


    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", key_opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", key_opts)
    end
end

-- auto install servers
-- Include the servers you want to have installed by default below
local servers = {
    "bashls",
    "dockerls",
    "gopls",
    "jsonls",
    "pylsp",
    -- install 3rd party plugins
    -- :PylspInstall pylsp-mypy pylsp-rope pyls-memestra
    "sumneko_lua",
    "texlab", -- testing
    "vimls",
    "zk" -- markdown for Zettelkasten - need 'zk' installed
}

-- install and handle lsps
require("nvim-lsp-installer").setup{
    ensure_installed = servers,
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
}


-- Provide settings that should only apply to the "<name>" server
local enhance_server_opts = {

    ["gopls"] = function(opts)
        opts.settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            }
        }
    end,

    ["jsonls"] = function(opts)
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jsonls
        -- should need snippet support
        opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    end,

    ["pylsp"] = function(opts)
        opts.settings = {
            pylsp = {
                plugins = {
                    pylint = {enabled = true; }

                }
            }
        }
    end,

    -- Configure lua language server for neovim development
    ["sumneko_lua"] = function(opts)
        opts.settings = {
            Lua = {
                runtime = {
                    -- LuaJIT in the case of Neovim
                    version = 'LuaJIT',
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                },
            }
        }
    end,

}

for _, server in ipairs(servers) do
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach
    }

    -- Enhance the default opts with the server-specific ones
    if enhance_server_opts[server] then
        enhance_server_opts[server](opts)
    end

    require("lspconfig")[server].setup{
        capabilities = opts.capabilities,
        on_attach = opts.on_attach,
        settings = opts.settings,
    }
end
