--
-- === COLOR & PLUGIN SETTINGS ===
--
--
-- set sonokai if installed silent to suppress errors if not
-- vim.g.sonokai_transparent_background = 1
-- vim.cmd('silent! colorscheme sonokai')

vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_color_gamma = "1.2"
vim.cmd('silent! colorscheme tokyodark')

-- " add visible column
vim.opt.termguicolors = true
vim.opt.colorcolumn='101'

-- Overwrite defaults of tokyodark
vim.cmd([[
highlight Normal guifg=#E8E8E8
highlight Comment guifg=#7f8490
highlight CursorWord gui=underline
]])

-- Highlight extra whitespaces
vim.cmd('highlight ExtraWhitespace ctermbg=darkblue guibg=#81A2BE')
-- nnoremap <F9> :set termguicolors!<CR>

-- LSP diagnostics color config {{{
-- TODO highlight currently not in vim.api
vim.cmd([[
hi DiagnosticDefaultError ctermfg=red guifg=#D54E53
hi DiagnosticVirtualTextError ctermfg=red  guifg=#D54E53

hi DiagnosticDefaultWarn ctermfg=yellow guifg=#E7C547
hi DiagnosticVirtualTextWarn ctermfg=yellow guifg=#E7C547

hi DiagnosticDefaultInfo ctermfg=white guifg=#EAEAEA
hi DiagnosticVirtualTextInfo ctermfg=white guifg=#EAEAEA

hi DiagnosticDefaultHint ctermfg=blue guifg=#7AA6DA
hi DiagnosticVirtualTextHint ctermfg=blue guifg=#7AA6DA
]])
-- }}}
