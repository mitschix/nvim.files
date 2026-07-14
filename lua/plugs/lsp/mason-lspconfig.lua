return {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        'mason-org/mason.nvim',
        {
            'neovim/nvim-lspconfig',
        },
    },
    config = function()
        require('mason-lspconfig').setup()

        local capabilities = require('blink.cmp').get_lsp_capabilities()

        vim.lsp.config('*', {
            capabilities = capabilities,
        })
    end,
}
