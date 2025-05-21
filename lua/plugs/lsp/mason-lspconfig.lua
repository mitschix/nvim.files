return {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'mason-org/mason.nvim',
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

        vim.lsp.config('*', {
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
}
