-- Coding {{{
-- Auto-format *.files prior to saving them{{{
vim.api.nvim_create_autocmd("BufWritePre", { pattern = "*.py", command = "lua vim.lsp.buf.formatting_sync(nil, 1000)" })
-- }}}

-- Highlight whitespaces {{{
local extra_whitespace = vim.api.nvim_create_augroup("ExtraWhitespace", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "InsertLeave" },
    { command = "silent! match ExtraWhitespace /\\s\\+$/", group = extra_whitespace })
vim.api.nvim_create_autocmd({ "InsertEnter" },
    { command = "silent! match ExtraWhitespace /\\s\\+\\%#\\@<!$/", group = extra_whitespace })
-- }}}

-- }}}

-- Folds with marker in given file types {{{
local mark_fold = vim.api.nvim_create_augroup("FoldMaker", { clear = true })
vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = { "tex", "vim", "lua", "zsh" },
    command = [[setlocal foldmethod=marker foldlevel=0]],
    group = mark_fold}
)
-- }}}

-- Misc {{{

-- Unset relativenumber on InsertEnter/BufLeaver.{{{
-- https://github.com/mathletedev/dotfiles/blob/main/.config/nvim/init.lua
vim.api.nvim_create_autocmd({"InsertEnter", "BufLeave", "FocusLost"}, { command = "set norelativenumber"})
vim.api.nvim_create_autocmd({"InsertLeave", "BufEnter", "FocusGained"}, { command = "set relativenumber"})
vim.api.nvim_create_autocmd({"FocusLost"}, { command = "set cursorline"})
vim.api.nvim_create_autocmd({"FocusGained"}, { command = "set nocursorline"})
-- }}}

-- go to last position when opening a buffer {{{
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  group = vim.api.nvim_create_augroup('LastPosition', {clear = true}),
  callback = function()
    local test_line_data = vim.api.nvim_buf_get_mark(0, '\"')
    local test_line = test_line_data[1]
    local last_line = vim.api.nvim_buf_line_count(0)

    if test_line > 0 and test_line <= last_line then
      vim.api.nvim_win_set_cursor(0, test_line_data)
    end
  end,
})
-- }}}

-- wrapping for txt {{{
local function setupWrapping()
    vim.w.wrap = true
    vim.bo.wm = 2
    vim.bo.textwidth=79
end

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, { pattern = {"*.txt"},
    callback = function () vim.schedule(setupWrapping) end})
-- }}}

-- }}}

-- Additional File opens {{{

-- open images with sxiv
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.png", "*.jpg","*.gif" },
    command = [[exec "!sxiv ".expand("%") | :bw]]})

-- open PDFs with zathura
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.pdf" },
    command = [[exec "!zathura ".expand("%") | :bw]]})


-- edit hex for bins - edit binary using xxd-format {{{
local binary = vim.api.nvim_create_augroup("Binary", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", { pattern = { "*.bin", "*.dat"},
    command = "let &bin=1", group = binary })
vim.api.nvim_create_autocmd("BufReadPost", { pattern = { "*.bin", "*.dat"},
    command = "if &bin | %!xxd", group = binary })
vim.api.nvim_create_autocmd("BufReadPost", { pattern = { "*.bin", "*.dat"},
    command = "set ft=xxd | endif", group = binary })
vim.api.nvim_create_autocmd("BufWritePre", { pattern = { "*.bin", "*.dat"},
    command = "if &bin | %!xxd -r", group = binary })
vim.api.nvim_create_autocmd("BufWritePre", { pattern = { "*.bin", "*.dat"},
    command = "endif", group = binary })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = { "*.bin", "*.dat"},
    command = "if &bin | %!xxd", group = binary })
vim.api.nvim_create_autocmd("BufWritePost", { pattern = { "*.bin", "*.dat"},
    command = "set nomod | endif", group = binary })
-- }}}

-- }}}

