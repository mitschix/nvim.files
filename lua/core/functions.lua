local key_opts_silent = {silent=true, noremap=true}

vim.g.diagnostics_active = true
vim.keymap.set('n', '<leader>D', function()
    vim.g.diagnostics_active = not vim.g.diagnostics_active
    if vim.g.diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end, key_opts_silent)


-- Closing and Exit {{{
-- custom exit function to close buffers before exiting
-- BUG: if multiple files opened at start and not loaded -> error

local function count_bufs_by_type(loaded_only)
    loaded_only = (loaded_only == nil and true or loaded_only)
    local count = {normal = 0, acwrite = 0, help = 0, nofile = 0, nowrite = 0, quickfix = 0, terminal = 0, prompt = 0}
    local buftypes = vim.api.nvim_list_bufs()
    for _, bufname in pairs(buftypes) do
        if (not loaded_only) or vim.api.nvim_buf_is_loaded(bufname) then
            local buftype_option = vim.api.nvim_buf_get_option(bufname, 'buftype')
            local buftype = buftype_option ~= '' and buftype_option or 'normal'
            count[buftype] = count[buftype] + 1
        end
    end
    return count
end

local function custom_exit(save, force)
    local bufTable = count_bufs_by_type()
    save = (save == nil and false or save)
    force = (force == nil and false or force)

    if save then vim.api.nvim_exec([[:w]], true) end
    if force then vim.api.nvim_exec([[:q!]], true) return end

    if (bufTable.normal <= 1) then
        vim.api.nvim_exec([[:q]], true)
    else
        vim.api.nvim_exec([[:bd]], true)
    end
end

vim.keymap.set('n', '<leader>qq', function() custom_exit() end, key_opts_silent)
vim.keymap.set('n', '<leader>qw', function() custom_exit(true) end, key_opts_silent)
vim.keymap.set('n', '<leader>q!', function() custom_exit(false, true) end, key_opts_silent)
-- }}}

-- WordCount for the Statusline {{{
-- Toggle word count in the panel if you hit <leader>wc
-- Update the word count if you hit <leader>wu, display in statusline
-- Add %{lua print(WORD_COUNT)} to statusline to see wordcount.
-- set statusline+=%{lua print(WORD_COUNT)}
WORD_COUNT = ''
local function word_count(update)
    update = (update == nil and false or update)
    if WORD_COUNT == '' or update then
        local count = vim.fn.wordcount().words
        if count == 0 then
            WORD_COUNT = "[none]"
        else
            WORD_COUNT = string.format("[%d]", count)
        end
    else
        WORD_COUNT = ''
    end
end
-- toggle wordcount functions
vim.keymap.set('n', '<leader>wc', function() word_count() end, key_opts_silent)
vim.keymap.set('n', '<leader>wu', function() word_count(true) end, key_opts_silent)
-- }}}

-- Change settings function {{{
----------------------------------------------------------------------------
-- <leader>c? : Toggle options
----------------------------------------------------------------------------
local function map_change_option(key, op)
    local opt_mappings = {
        wrap = "vim.wo.wrap",
        list = "vim.wo.list",
        hlsearch = "vim.go.hlsearch"
    }

    if key == 'n' then
        vim.keymap.set('n', '<leader>cn', function()
            vim.wo.number = not vim.wo.number
            vim.wo.relativenumber = not vim.wo.relativenumber
        end, key_opts_silent)
    elseif key == 'm' then
        vim.keymap.set('n', '<leader>cm', function()
            vim.go.mouse = vim.go.mouse == "" and "a" or ""
            print(string.format(" %s set: %s", op, vim.go.mouse == "a"))
        end, key_opts_silent)
    else
        -- old vim script
        -- let [key, opt] = a:000[0:1]
        -- let op = get(a:, 3, 'set '.opt.'!')
        -- execute printf("nnoremap <leader>c%s :%s<bar>set %s?<CR>", key, op, opt)

        vim.keymap.set('n', '<leader>c'..key, function()
            local option = opt_mappings[op]
            local cmd = string.format("%s = not %s", option, option)
            loadstring(cmd)()
            cmd = string.format("print(' %s set: '..tostring(%s))",op, option)
            loadstring(cmd)()
        end, key_opts_silent)
    end
end

map_change_option("n", "number")
map_change_option("w", "wrap")
map_change_option("l", "list")
map_change_option("h", "hlsearch")
map_change_option("m", "mouse")

-- WIP - really needed?
-- map_change_option("t", "textwidth", 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
--}}}
