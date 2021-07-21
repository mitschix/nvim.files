inoremap ,i ![](<++>){#fig:<++>}<Space><CR><CR><++><Esc>kkF]i
inoremap ,a [](<++>)<Space><++><Esc>F]i
inoremap ,1 #<Space><CR><CR><++><Esc>2k<S-a>
inoremap ,2 ##<Space><CR><CR><++><Esc>2k<S-a>
inoremap ,3 ###<Space><CR><CR><++><Esc>2k<S-a>
inoremap ,4 ####<Space><CR><CR><++><Esc>2k<S-a>
inoremap ,5 #####<Space><CR><CR><++><Esc>2k<S-a>
inoremap ,u +<Space><CR><++><Esc>1k<S-a>
inoremap ,o 1.<Space><CR><++><Esc>1k<S-a>
inoremap ,f +@fig:

" bold
nnoremap <buffer> <A-b> ciw**<C-r>-**<Esc>
xnoremap <buffer> <A-b> c**<C-r>-**<Esc>
" italic
nnoremap <buffer> <A-i> ciw*<C-r>-*<Esc>
xnoremap <buffer> <A-i> c*<C-r>-*<Esc>
