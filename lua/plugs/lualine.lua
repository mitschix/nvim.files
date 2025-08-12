return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local lazy_status = require('lazy.status') -- to configure lazy pending updates count
        -- use gitsigns icons as source for lualine -> updates on every change
        local function diff_source()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
                return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                }
            end
        end

        local function spell_stat()
            if vim.wo.spell then return string.format('[%s]', vim.opt.spelllang['_value']) end
            return ''
        end

        -- Define a function to check that ollama is installed and working
        local function get_condition() return package.loaded['ollama'] and require('ollama').status ~= nil end

        -- Define a function to check the status and return the corresponding icon
        local function get_status_icon()
            local status = require('ollama').status()

            if status == 'IDLE' then
                return '󱙺 ' -- nf-md-robot-outline
            elseif status == 'WORKING' then
                return '󰚩 ' -- nf-md-robot
            end
        end

        require('lualine').setup({
            options = {
                theme = 'onedark',
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        separator = { left = '', right = '' },
                        fmt = function(str) return str:gsub('-', ''):sub(1, 2) end,
                    },
                },
                -- uses gitsigns instead of builtin
                lualine_b = { { 'b:gitsigns_head', icon = '' }, { 'diff', source = diff_source } },
                lualine_c = {
                    { 'filename', path = 3, file_status = false, separator = '' },
                    { '%m%r%h', color = { fg = 204 } },
                },
                lualine_x = {
                    { 'WORD_COUNT', color = { fg = 111 }, icon = '' },
                    { spell_stat, color = { fg = 222 }, icon = '🆎' },
                    {
                        lazy_status.updates,
                        cond = lazy_status.has_updates,
                        color = { fg = '#ff9e64' },
                    },
                    'filetype',
                },
                lualine_y = { '%l/%L - %c' },
                lualine_z = { { 'progress', separator = { left = '', right = '' } } },
            },
            inactive_sections = {
                lualine_c = { { 'filename', path = 3, file_status = true, separator = '' } },
                lualine_x = { 'location' },
            },
            winbar = {
                lualine_b = {
                    function() return require('lspsaga.symbol.winbar').get_bar() end,
                },
                lualine_x = { { get_status_icon, cond = get_condition() }, 'diagnostics' },
                lualine_y = { 'buffers' },
            },
            inactive_winbar = {
                lualine_y = { 'buffers' },
            },
            extensions = { 'nvim-tree' },
        })
    end,
}
