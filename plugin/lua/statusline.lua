-- use gitsigns icons as source for lualine -> updates on every change
local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
    return {
        added = gitsigns.added,
        modified = gitsigns.changed,
        removed = gitsigns.removed
    }
    end
end

local function spell_stat()
    if vim.wo.spell then
        return string.format('[%s]', vim.opt.spelllang['_value'])
    end
    return ''
end

require('lualine').setup{
    options = {
        theme = 'onedark',
    },
    sections = {
        lualine_a = {{'mode', separator = { left = '', right = ''},
            fmt = function(str) return str:gsub('-',''):sub(1,2) end},
        },
        -- uses gitsigns instead of builtin
        lualine_b = {{'b:gitsigns_head', icon = ''}, {'diff', source = diff_source}},
        lualine_c = {{'filename', path = 3, file_status = false, separator = ''},
                    {'%m%r%h', color = {fg=204}}},
        lualine_x = {{'WORD_COUNT', color = {fg=111}, icon = ''},
                    {spell_stat, color = {fg=222}, icon = '🆎'},
                    'diagnostics', 'filetype'},
        lualine_y = {'%l/%L - %c'},
        lualine_z = {{'progress', separator = { left = '', right = ''}}}
    },
    extensions = {'fzf', 'nvim-tree'}
}
