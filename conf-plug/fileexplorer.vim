
" === EXPLORER (PLUGIN) SETTINGS ===


" NnnPicker settings
let g:nnn#layout = { 'left': '~20%' } "
let g:nnn#action = {'<c-t>': 'tab split', '<c-x>': 'split', '<c-v>': 'vsplit' }

" netrw is no plugin but still handles here
" netrw file explorer settings
let g:NetrwIsOpen=0
let g:netrw_liststyle = 3
let g:netrw_banner = 1
let g:netrw_winsize = 15
let g:netrw_browse_split = 0
let g:netrw_altv = 1

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction

