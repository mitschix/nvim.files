return {
    -- install fzf as command and as plugin
    {'ibhagwan/fzf-lua', event = { "BufReadPre", "BufNewFile" },
    dependencies = {'junegunn/fzf', build = './install --all --xdg --no-update-rc' },
    config = function ()
        -- fzf-lua {{{
            local fzf_lua = require("fzf-lua")

            fzf_lua.setup({
                fzf_opts = { ['--layout'] = "default" },
            })
            -- inspired by fzf.vim from https://github.com/uolot/dotfiles/blob/master/vim/files-fzf.vim
            local hide_preview = { winopts = { preview={hidden="hidden"} }}
            vim.keymap.set('n', '<leader>pf', function() fzf_lua.files() end)
            vim.keymap.set('n', '<leader>pl', function() fzf_lua.blines(hide_preview) end)
            vim.keymap.set('n', '<leader>pL', function() fzf_lua.lines(hide_preview) end)
            vim.keymap.set('n', '<leader>pb', function() fzf_lua.buffers() end)
            vim.keymap.set('n', '<leader>pg', function() fzf_lua.grep(hide_preview) end)
            vim.keymap.set('n', '<leader>pk', function() fzf_lua.keymaps() end)
            -- Opens with the path of the currently edited file filled in
            vim.keymap.set('n', '<leader>e', function() fzf_lua.files({cwd = vim.fn.expand('%:p:h')}) end)
        -- }}}
    end
    },
    {"ahmedkhalf/project.nvim",
    keys = {
        -- use project_nvim to change to project per fzf {{{
        {'<leader>pp', function ()
            local fzf_lua = require("fzf-lua")
            local history = require("project_nvim.utils.history")
            fzf_lua.fzf_exec(function(cb)
                local results = history.get_recent_projects()
                for _, e in ipairs(results) do
                    cb(e)
                end
                cb()
            end,
            {
                actions = {
                    ['default'] = {
                        function(selected)
                            fzf_lua.files({ cwd = selected[1] })
                        end,
                    },
                    ['ctrl-d'] = {
                        function(selected)
                            history.delete_project({ value = selected[1] })
                        end,
                        fzf_lua.actions.resume
                    }
                }
            })
        end}
        -- }}}
    },
    config = function() require("project_nvim").setup() end
    }
}
