return {
    -- scad 3D modeling?
    'salkin-mada/openscad.nvim',
    lazy = true,
    ft = { 'openscad' },
    config = function()
        require('openscad')
        -- load snippets, note dependencies
        vim.g.openscad_auto_open = false
        vim.g.openscad_load_snippets = true
        vim.g.openscad_fuzzy_finder = 'fzf'
        vim.g.openscad_cheatsheet_toggle_key = '<M-c>'
        vim.g.openscad_help_manual_trig_key = '<C-m>'
        vim.g.openscad_help_trig_key = '<M-f>'
    end,
    dependencies = 'L3MON4D3/LuaSnip',
}
