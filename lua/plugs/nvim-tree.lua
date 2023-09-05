return {
    'nvim-tree/nvim-tree.lua', lazy = true,
    keys = {{'<F2>','<cmd>NvimTreeToggle<CD>'}},
    dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function ()
        local function on_attach(bufnr)
            local api = require('nvim-tree.api')

            local function opts(desc)
                return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            vim.keymap.set('n', '<C-[>', api.tree.change_root_to_parent, opts('Up'))
            vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
            vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))

        end

        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require'nvim-tree'.setup{
            on_attach = on_attach,
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
            }
        }

        -- autoclose nvim tree when last file
        vim.cmd[[autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif]]

        end
    }
