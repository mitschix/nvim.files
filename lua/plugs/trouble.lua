return {
    -- Trouble to show diagnostics/loc list/quickfix prettier
    -- also show TODO if toggled
    {
        "folke/trouble.nvim",
        lazy=true, cmd = {'Trouble'},
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup()
            -- Trouble shortcuts {{{
            vim.keymap.set("n", "<leader>xx", "<CMD>Trouble<CR>")
            vim.keymap.set("n", "<leader>xw", "<CMD>Trouble workspace_diagnostics<CR>")
            vim.keymap.set("n", "<leader>xd", "<CMD>Trouble document_diagnostics<CR>")
            vim.keymap.set("n", "<leader>xl", "<CMD>Trouble loclist<CR>")
            vim.keymap.set("n", "<leader>xq", "<CMD>Trouble quickfix<CR>")
            vim.keymap.set("n", "gR", "<CMD>Trouble lsp_references<CR>")
            -- }}}
        end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup { } end,
      lazy=true, cmd = {'TodoLocList'}
    },
}
