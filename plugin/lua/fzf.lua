-- fzf.vim settings
 vim.opt.wildignore = '*.o,*.obj,.git,*.rbc,*.pyc,__pycache__'

-- if rg exists set other vim grep method and update fzf command
if 1 == vim.fn.executable("rg") then
    vim.o.grepprg = [[rg --hidden --glob "!.git" --no-heading --smart-case --vimgrep --follow $*]]
    vim.opt.grepformat = vim.opt.grepformat ^ { "%f:%l:%c:%m" }

    vim.env.FZF_DEFAULT_COMMAND = [[rg --files --hidden --follow]]
    vim.cmd [[
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
    ]]
else
    vim.env.FZF_DEFAULT_COMMAND = [[find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null]]
end

-- shortcuts
-- https://github.com/uolot/dotfiles/blob/master/vim/files-fzf.vim
vim.api.nvim_set_keymap('n', '<leader>pf', ":GFiles<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>pF', ":Files<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>pl', ":BLines<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>pL', ":Lines<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>pt', ":Tags<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>pb', ":Buffers<CR>", {noremap = true})

-- Opens with the path of the currently edited file filled in
vim.keymap.set('n', '<leader>e', ':GFiles <C-R>=expand("%:p:h") <CR><CR>')

-- currently does not work?
vim.api.nvim_set_keymap('i', '<c-f>', "fzf#vim#complete#path('rg --hidden --files')", {noremap = true, expr = true})

-- TODO: sets permanently -> prevent makros
-- vim.cmd[[au FileType fzf nnoremap <silent> q :q<CR>]]
