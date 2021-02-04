

" === TODO & DEPRECATED CONFIG ===


" settings for TODO management {{{

" Navigating with guides
" placeholder is <++>
" inoremap <leader>t <++><Esc>
" map <leader>t <Esc>i<++><Esc>
"
" inoremap <leader>T <Esc>/<++><Enter>"_c4l
" map <leader>T <Esc>/<++><Enter>"_c4l
"
" inoremap <leader><space> <Esc>/<++><Enter>
" map <leader><space> <Esc>/<++><Enter>
" }}}

" FIXME key still mapped after commented out
" List navigation {{{
"
" nmap <left>  :cprev<cr>zvzz
" nmap <right> :cnext<cr>zvzz
" nmap <up>    :lprev<cr>zvzz
" nmap <down>  :lnext<cr>zvzz
"
" " }}}

" fix cursor of zsh-vi-mode (deprecated?)
" autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
" autocmd VimLeave * silent exec "! echo -ne '\e[5 q'"

" highlight insert mode
" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul

