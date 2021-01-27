

" === FUNCTIONS ===


" Closing and Exit {{{
let g:spacevim_smartcloseignorewin     = ['__Tagbar__' , 'vimfiler:default']
let g:spacevim_smartcloseignoreft      = []

fu! SmartClose() abort
    let ignorewin = get(g:,'spacevim_smartcloseignorewin',[])
    let ignoreft = get(g:, 'spacevim_smartcloseignoreft',[])
    " @bug vim winnr('$') do not include popup
    " ref: https://github.com/vim/vim/issues/6474
    let win_count = winnr('$')
    let num = win_count
    for i in range(1,win_count)
        if index(ignorewin , bufname(winbufnr(i))) != -1 || index(ignoreft, getbufvar(bufname(winbufnr(i)),'&filetype')) != -1
            let num = num - 1
        elseif getbufvar(winbufnr(i),'&buftype') ==# 'quickfix'
            let num = num - 1
        elseif getwinvar(i, '&previewwindow') == 1 && winnr() !=# i
            let num = num - 1
        " elseif s:WIN.is_float(i)
        "     let num = num - 1
        endif
    endfor
    if num == 1
    else
        quit
    endif
endf

" custom exit function to close buffers before exiting
function! CustomExit()
    if (len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1)
        q
    else
        bd
    endif
endfunction
" }}}

" Change Settings Functions {{{
" ----------------------------------------------------------------------------
" <leader>c? : Toggle options
" ----------------------------------------------------------------------------
function! Map_change_option(...)
    let [key, opt] = a:000[0:1]
    " remap for number to disable number and relativenumber
    if key == "n"
        execute printf("nnoremap <leader>c%s :set number! relativenumber!<CR>", key)
    elseif key == "g"
        execute printf("nnoremap <leader>c%s :Goyo<CR>", key)
    else
        let op = get(a:, 3, 'set '.opt.'!')
        execute printf("nnoremap <leader>c%s :%s<bar>set %s?<CR>", key, op, opt)
    endif
endfunction
" }}}

" WordCount for the Statusline {{{
" Toggle word count in the panel if you hit <leader>wc
" Update the word count if you hit <leader>wu, display in statusline
" Add %{g:word_count} to statusline to see wordcount.
" set statusline+=%{g:word_count}
let g:word_count = ''
function! WordCount(...)
    if a:0 < 1
        let s:update = 0
    else
        let s:update = 1
    endif
    if g:word_count == '' || s:update == 1
        let position = getpos(".")
        exe ":silent normal g\<c-g>"
        let stat = v:statusmsg
        let g:word_count = 0
        if stat != '--No lines in buffer--'
            let s:words =  str2nr(split(v:statusmsg)[11])
            let g:word_count = printf('.Words [%d].', s:words)
        else
            let g:word_count = 'Words [none]'
        end
        call setpos('.', position)
        return g:word_count
    else
        let g:word_count = ''
        return g:word_count
    end
endfunction
" }}}
