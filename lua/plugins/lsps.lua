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
    buf_set_keymap('n', 'ca', ':Lspsaga code_action<CR>', key_opts)
    buf_set_keymap('n', 'cd', ':Lspsaga show_line_diagnostics<CR>', key_opts)
    -- vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', key_opts)
    buf_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', key_opts)
    buf_set_keymap('n', '<C-p>', ':Lspsaga diagnostic_jump_prev<CR>', key_opts)
    buf_set_keymap('n', '<C-n>', ':Lspsaga diagnostic_jump_next<CR>', key_opts)
    -- }}}


    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", key_opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", key_opts)
    end
end

-- install and handle lsps
local lsp_installer = require("nvim-lsp-installer")

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

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
    "zk" -- markdown for Zettelkasten
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print("Installing " .. name)
        server:install()
    end
end


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

    -- ["pylsp"] = function(opts)
    --     opts.settings = {
    --         pylsp = {
    --             plugins = {
    --                 pylint = {enabled = true; }
    --             }
    --         }
    --     }
    -- end,

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

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
lsp_installer.on_server_ready(function(server)
    local opts = {
        capabilities = capabilities,
        on_attach = on_attach
    }

    -- Enhance the default opts with the server-specific ones
    if enhance_server_opts[server.name] then
        enhance_server_opts[server.name](opts)
    end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
