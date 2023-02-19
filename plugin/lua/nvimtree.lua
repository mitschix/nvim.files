local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_auto_ignore_ft = {'startify'}

require'nvim-tree'.setup{
    hijack_cursor = true,

    renderer ={
        add_trailing = true,
        highlight_git = true,
        indent_markers = {enable = true},
        icons = {
            show = {
                file = true,
                folder = true,
                git = false
            }
        }
    },

    view ={
        mappings = {
            list = {
                { key = "<C-[>", cb = tree_cb("dir_up") },
                { key = "h", cb = tree_cb("close_node") },
                { key = "l", cb = tree_cb("edit") },
            }
        }
    }
}

-- autoclose nvim tree when last file
vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]
