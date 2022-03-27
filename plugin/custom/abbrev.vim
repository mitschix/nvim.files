

" === ABBREVATIONS ===



""" Abbreviations {{{
" remove whitespace after abbrev
" https://github.com/godlygeek/vim-files/blob/master/.vimrc
function! EatChar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

iabbr _me mitschix (23629789+mitschix@users.noreply.github.com)<C-R>=EatChar('\s')<CR>"
iabbr _github mitschix https://github.com/mitschix<C-R>=EatChar('\s')<CR>
iabbr _gitlab mitschix 10944515-mitschix@users.noreply.gitlab.com<C-R>=EatChar('\s')<CR>"
iabbr _t  <C-R>=strftime("%H:%M:%S")<CR><C-R>=EatChar('\s')<CR>
iabbr _d  <C-R>=strftime("%a, %d %b %Y")<CR><C-R>=EatChar('\s')<CR>
iabbr _dt <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><C-R>=EatChar('\s')<CR>

inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)
"}}}

cabbrev help vertical help

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
