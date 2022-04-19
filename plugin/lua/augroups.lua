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
local mark_fold = vim.api.nvim_create_augroup("ExtraWhitespace", { clear = true })
vim.api.nvim_create_autocmd(
    "FileType",
    { pattern = { "tex", "vim", "lua", "zsh" },
    command = [[setlocal foldmethod=marker foldlevel=0]],
    group = mark_fold}
)
-- }}}

-- Misc {{{

-- Unset paste on InsertLeave.{{{
vim.api.nvim_create_autocmd("InsertLeave", { command = "silent! set nopaste" })
-- }}}

-- go to last loc when opening a buffer {{{
vim.api.nvim_create_autocmd("BufReadPost",
    { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]] }
)
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

