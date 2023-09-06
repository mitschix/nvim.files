return {
    -- Trouble to show diagnostics/loc list/quickfix prettier
    -- also show TODO if toggled
    {
        "folke/trouble.nvim",
        lazy=true, keys = {'<leader>xx'}, cmd = {'TroubleToggle'},
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup({
                position = "right",
                auto_preview = false,
            })
            -- Trouble shortcuts {{{
            vim.keymap.set("n", "<leader>xx", "<CMD>TroubleToggle<CR>")
            vim.keymap.set("n", "<leader>xd", "<CMD>TroubleToggle workspace_diagnostics<CR>")
            vim.keymap.set("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>")
            vim.keymap.set("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>")
            vim.keymap.set("n", "gR", "<CMD>Trouble lsp_references<CR>")
            -- }}}
        end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = {"nvim-lua/plenary.nvim", "folke/trouble.nvim"},
      config = true, lazy=true, cmd = {'TodoTrouble'},
      keys = {{"<leader>xt", "<CMD>TroubleToggle todo<CR>"}}
    },
}
