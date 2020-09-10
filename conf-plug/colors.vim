

" === COLOR & PLUGIN SETTINGS ===


" add theme of plugin
" adjust colors per function
function! AdaptColorscheme()
    hi Normal ctermbg=none ctermfg=white
    hi LineNr ctermbg=none ctermfg=180
    hi CursorLineNr ctermbg=none ctermfg=173
    hi Comment ctermbg=none ctermfg=145

    " adjust git gutter colors
    hi GitGutterAdd ctermfg=2
    hi GitGutterChange ctermfg=180
    hi GitGutterDelete ctermfg=204
endfunction
" call it all the time when colorscheme is changed
" because of Goyo
autocmd ColorScheme * call AdaptColorscheme()

" set plastic if installed silent to suppress errors if not
silent! colorscheme plastic


" fix colorscheme to use 256 Colors
set t_Co=256

" add visible column
set colorcolumn=90
hi ColorColumn ctermbg=green

" change theme for completion windows
highlight Pmenu ctermfg=blue ctermbg=black

" adjust color of tabline
hi TabLine ctermfg=green ctermbg=235
hi TabLineSel ctermfg=204 ctermbg=59
hi TabLineFill ctermfg=235
