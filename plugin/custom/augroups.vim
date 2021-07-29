

" === AUGROUPS ===


" Coding {{{
" python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" edit hex for bins
"
" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.dat let &bin=1
  au BufReadPost *.dat if &bin | %!xxd
  au BufReadPost *.dat set ft=xxd | endif
  au BufWritePre *.dat if &bin | %!xxd -r
  au BufWritePre *.dat endif
  au BufWritePost *.dat if &bin | %!xxd
  au BufWritePost *.dat set nomod | endif
augroup END

" }}}


" highlight whietspaces {{{
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
augroup extra-whitespace
    au BufNewFile,BufRead,InsertLeave * silent! match ExtraWhitespace /\s\+$/
    au InsertEnter * silent! match ExtraWhitespace /\s\+\%#\@<!$/
augroup END
" }}}


" wrapping for txt {{{
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
" }}}

" Misc {{{
augroup mark-fold
  autocmd!
  autocmd FileType tex,vim,zsh setlocal foldmethod=marker foldlevel=0
augroup END

" open images with imv
autocmd BufEnter *.png,*.jpg,*.gif exec "!sxiv ".expand("%") | :bw
" open PDFs with zathura
autocmd BufEnter *.pdf exec "!zathura ".expand("%") | :bw

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" }}}

" Auto-format *.files prior to saving them{{{
" quickfix for jumping cursor on format
lua <<EOF
function format_py()
    local lineno = vim.api.nvim_win_get_cursor(0)
    vim.lsp.buf.formatting_sync(nil, 1000)
    vim.api.nvim_win_set_cursor(0, lineno)
end
EOF
autocmd BufWritePre *.py lua format_py()
"}}}
