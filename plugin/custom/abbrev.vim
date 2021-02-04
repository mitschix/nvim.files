

" === ABBREVATIONS ===



cabbrev help vertical help

inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)
" ----------------------------------------------------------------------------

" Create a doc string - need the docstring file
" <date> will be replaced by current date YYYYMMDD format x2
inoreabbrev __dcstr <ESC>:r!cat ~/.config/nvim/tmpl/.docstring<CR>?<date><CR>ciW<C-R>=strftime('%Y%m%d')<CR><ESC>?<date><CR>ciW<C-R>=strftime('%Y%m%d')<CR>

" Text-Emojis {{{
iabbrev shrug ¯\_(ツ)_/¯
iabbrev tableflip (╯°□°）╯彡┻━┻
" }}}

" Typo fix Setting {{{
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" }}}
