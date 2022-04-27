local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_auto_ignore_ft = {'startify'}
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = vim.api.nvim_eval('{"git": 0, "folders": 1, "files": 1}')

require'nvim-tree'.setup{
    hijack_cursor = true,
    open_on_setup = true,
    renderer ={indent_markers = {enable = true}},

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
