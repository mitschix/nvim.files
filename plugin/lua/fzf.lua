-- fzf.vim settings
-- if rg exists set other vim grep method and update fzf command
if 1 == vim.fn.executable("rg") then
    vim.env.FZF_DEFAULT_COMMAND = [[rg --files --hidden --follow]]
    vim.cmd [[
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    ]]
else
    vim.env.FZF_DEFAULT_COMMAND = [[find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null]]
end

-- shortcuts
-- https://github.com/uolot/dotfiles/blob/master/vim/files-fzf.vim
vim.keymap.set('n', '<leader>pf', ":GFiles<CR>")
vim.keymap.set('n', '<leader>pF', ":Files<CR>")
vim.keymap.set('n', '<leader>pl', ":BLines<CR>")
vim.keymap.set('n', '<leader>pL', ":Lines<CR>")
vim.keymap.set('n', '<leader>pt', ":Tags<CR>")
vim.keymap.set('n', '<leader>pb', ":Buffers<CR>")

-- Opens with the path of the currently edited file filled in
vim.keymap.set('n', '<leader>e', ':GFiles <C-R>=expand("%:p:h") <CR><CR>')

-- TODO: sets permanently -> prevent makros
-- vim.cmd[[au FileType fzf nnoremap <silent> q :q<CR>]]

-- other plugins?
-- https://github.com/ibhagwan/fzf-lua
