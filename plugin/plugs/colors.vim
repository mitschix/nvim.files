

" === COLOR & PLUGIN SETTINGS ===


" add theme of plugin
" set plastic if installed silent to suppress errors if not
silent! colorscheme sonokai
" silent! colorscheme plastic

" add visible column
set colorcolumn=81
highlight ExtraWhitespace ctermbg=darkblue guibg=#81A2BE
nnoremap <F9> :set termguicolors!<CR>
set termguicolors

" LSP diagnostics color config {{{
hi DiagnosticDefaultError ctermfg=red guifg=#D54E53
hi DiagnosticVirtualTextError ctermfg=red  guifg=#D54E53

hi DiagnosticDefaultWarn ctermfg=yellow guifg=#E7C547
hi DiagnosticVirtualTextWarn ctermfg=yellow guifg=#E7C547

hi DiagnosticDefaultInfo ctermfg=white guifg=#EAEAEA
hi DiagnosticVirtualTextInfo ctermfg=white guifg=#EAEAEA

hi DiagnosticDefaultHint ctermfg=blue guifg=#7AA6DA
hi DiagnosticVirtualTextHint ctermfg=blue guifg=#7AA6DA
" }}}

" GitSigns color config {{{
hi GitSignsAdd ctermfg=green guifg=#A3BE8C
hi GitSignsChange ctermfg=yellow guifg=#E0C387
hi GitSignsDelete ctermfg=red guifg=#BF616A
" }}}
