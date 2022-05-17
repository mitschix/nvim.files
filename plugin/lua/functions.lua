vim.g.diagnostics_active = true
vim.keymap.set('n', '<leader>D', function()
  vim.g.diagnostics_active = not vim.g.diagnostics_active
  if vim.g.diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end, {silent=true, noremap=true})
