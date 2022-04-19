vim.g.diagnostics_visible = true
function _G.toggle_diagnostics()
  if vim.g.diagnostics_visible then
    vim.g.diagnostics_visible = false
    vim.diagnostic.disable()
  else
    vim.g.diagnostics_visible = true
    vim.diagnostic.enable()
  end
end
vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>D', ':call v:lua.toggle_diagnostics()<CR>', {silent=true, noremap=true})
