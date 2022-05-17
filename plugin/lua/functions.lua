vim.g.diagnostics_active = true
vim.keymap.set('n', '<leader>D', function()
    vim.g.diagnostics_active = not vim.g.diagnostics_active
    if vim.g.diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end, {silent=true, noremap=true})


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

vim.keymap.set('n', '<leader>qq', function() custom_exit() end, {silent=true, noremap=true})
vim.keymap.set('n', '<leader>qw', function() custom_exit(true) end, {silent=true, noremap=true})
vim.keymap.set('n', '<leader>q!', function() custom_exit(false, true) end, {silent=true, noremap=true})
-- }}}
